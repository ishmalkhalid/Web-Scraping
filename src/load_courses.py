# load_courses.py

# import requests
# res = requests.get("https://cs.nyu.edu/dynamic/courses/schedule/?semester=fall_2020&day=T")
# print(res.status_code) # http response status code (you want a 200)
# print(res.text) # the contents / body of the response

from configparser import ConfigParser
import pymysql

def get_config(fn):
	parser = ConfigParser()
	parser.read(fn)
	db = parser.items('db')
	return {name: value for name, value in db}

def get_conn(conf):
	conn = pymysql.connect(**conf, cursorclass = pymysql.cursors.DictCursor)
	return conn

def insert_course(conn, courseNumber, courseName, Professor, Cancelled, Office_Hours, Meet_Time, Room, Semester):
	cursor = conn.cursor()
	q = 'INSERT INTO Course VALUES (%s, %s, %s, %s, %s, %s, %s, %s)'
	cursor.execute(q, (courseNumber, courseName, Professor, Cancelled, Office_Hours, Meet_Time, Room, Semester))
	conn.commit()

conf = get_config('/home/ik1299/csci60-hw07/config.ini')
conn = get_conn(conf)
print(conf)

import urllib.request
from bs4 import BeautifulSoup
fallurl = 'https://cs.nyu.edu/dynamic/courses/schedule/?semester=fall_2020'
springurl = 'https://cs.nyu.edu/dynamic/courses/schedule/?semester=spring_2020'
fallresponse = urllib.request.urlopen(fallurl)
springresponse = urllib.request.urlopen(springurl)
fres = fallresponse.read().decode('utf-8')
sres = springresponse.read().decode('utf-8')

#spring
dom = BeautifulSoup(sres, features="html.parser")
table = dom.select_one('ul.schedule-listing').select("li.row")
classNumber = []
courseName = []
professor = []
cancelled = []
officeHours = []
meetTime = []
room = []
semester = []
for row in table:
	cols = row.select("span")
	classNumber.append(cols[0].get_text().split()[0].replace('-\u200b', '').strip())
	courseName.append(" ".join(cols[1].get_text().split()))
	professorName = cols[2].get_text().strip().split('\n')[0]
	semester.append("SPRING2020")
	if professorName == "CANCELLED":
		professor.append("NULL")
		officeHours.append("NULL")
		cancelled.append("CANCELLED")
		meetTime.append("NULL")
		room.append("NULL")
	else:
		professor.append(professorName)
		cancelled.append("NULL")
		if cols[2].get_text().strip().split()[-1] == "Hours":
			officeHours.append("YES")
		else:
			officeHours.append("NO")
		if cols[3].get_text().strip() != "-": 
			meetTime.append(cols[3].get_text().strip())
		else:
			meetTime.append("NULL")
		if cols[4].get_text().strip() != '':
			room.append(cols[4].get_text().strip())
		else:
			room.append("NULL")
	insert_course(conn, classNumber[-1], courseName[-1], professor[-1], cancelled[-1], officeHours[-1], meetTime[-1], room[-1], semester[-1])	
#fall
dom = BeautifulSoup(fres, features="html.parser")
table = dom.select_one('ul.schedule-listing').select("li.row")
for row in table:
	cols = row.select("span")
	classNumber.append(cols[0].get_text().split()[0].replace('-\u200b', '').strip())
	courseName.append(" ".join(cols[1].get_text().split()))
	professorName = cols[2].get_text().strip().split('\n')[0]
	semester.append("FALL2020")
	if professorName == "CANCELLED":
		professor.append("NULL")
		officeHours.append("NULL")
		cancelled.append("YES")
		meetTime.append("NULL")
		room.append("NULL")
	else:
		professor.append(professorName)
		cancelled.append("NO")
		if cols[2].get_text().strip().split()[-1] == "Hours":
			officeHours.append("YES")
		else:
			officeHours.append("NO")
		if cols[3].get_text().strip() != "-": 
			meetTime.append(cols[3].get_text().strip())
		else:
			meetTime.append("NULL")
		# print(cols[4].get_text().strip())
		if cols[4].get_text().strip() != '':
			room.append(cols[4].get_text().strip())
		else:
			room.append("NULL")
	insert_course(conn, classNumber[-1], courseName[-1], professor[-1], cancelled[-1], officeHours[-1], meetTime[-1], room[-1], semester[-1])


print(classNumber)
print(courseName)
print(professor)
print(cancelled)
print(officeHours)
print(meetTime)
print(room)
print(semester)

