## Part 1 Queries


# 1) DESCRIBE your table(s)
DESCRIBE Course;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| courseNumber | varchar(25) | NO   | PRI | NULL    |       |
| courseName   | varchar(45) | NO   |     | NULL    |       |
| Professor(s) | varchar(45) | NO   |     | NULL    |       |
| Cancelled    | varchar(45) | NO   |     | NULL    |       |
| Office_Hours | varchar(45) | NO   |     | NULL    |       |
| Meet_Time    | varchar(45) | NO   |     | NULL    |       |
| Room         | varchar(45) | NO   |     | NULL    |       |
| Semester     | varchar(45) | NO   | PRI | NULL    |       |
+--------------+-------------+------+-----+---------+-------+



# 2) show the first few rows
SELECT * FROM Course LIMIT 10;
+-----------------+-----------------------------------+---------------------+-----------+--------------+---------------+------------------+------------+
| courseNumber    | courseName                        | Professor           | Cancelled | Office_Hours | Meet_Time     | Room             | Semester   |
+-----------------+-----------------------------------+---------------------+-----------+--------------+---------------+------------------+------------+
| CSCI-GA.1133001 | PAC I*                            | Evan Korth          | NO        | YES          | T 6:30-9:00PM | ONLINE           | FALL2020   |
| CSCI-GA.1133002 | PAC I Recitation                  | Nolan Filter        | NO        | NO           | W 6:10-7:00PM | ONLINE           | FALL2020   |
| CSCI-GA.1133003 | PAC I Recitation                  | NULL                | YES       | NULL         | NULL          | NULL             | FALL2020   |
| CSCI-GA.1144001 | PAC II*                           | Mohamed Zahran      | NULL      | YES          | T 6:00-8:30PM | CIWW 312         | SPRING2020 |
| CSCI-GA.1144002 | PAC II Recitation                 | Rutviben Malaviya   | NULL      | NO           | R 7:10-8:00PM | CIWW 312         | SPRING2020 |
| CSCI-GA.1170001 | Fundamental Algorithms            | Richard  Cole       | NO        | YES          | T 5:10-7:00PM | ONLINE           | FALL2020   |
| CSCI-GA.1170001 | Fundamental Algorithms            | Chee Yap            | NULL      | YES          | M 5:10-7:00PM | 60 Fifth Ave 110 | SPRING2020 |
| CSCI-GA.1170002 | Fundamental Algorithms Recitation | Harish Karthikeyan  | NO        | NO           | R 5:10-6:00PM | CIWW 109         | FALL2020   |
| CSCI-GA.1170002 | Fundamental Algorithms Recitation | Abhinav Tamaskar    | NULL      | NO           | W 5:10-6:00PM | CIWW 101         | SPRING2020 |
| CSCI-GA.1170003 | Fundamental Algorithms            | Alexander Alekseyev | NO        | YES          | W 5:10-7:00PM | ONLINE           | FALL2020   |
+-----------------+-----------------------------------+---------------------+-----------+--------------+---------------+------------------+------------+


# 3) show all fall courses that got cancelled
SELECT * FROM Course WHERE Cancelled = "YES" AND Semester = "FALL2020";
+-----------------+-----------------------------------------------+--------------+-----------+--------------+-----------+------+----------+
| courseNumber    | courseName                                    | Professor    | Cancelled | Office_Hours | Meet_Time | Room | Semester |
+-----------------+-----------------------------------------------+--------------+-----------+--------------+-----------+------+----------+
| CSCI-GA.1133003 | PAC I Recitation                              | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.1170007 | Fundamental Algorithms Recitation             | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2110004 | Programming Languages Recitation              | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2110005 | Programming Languages Recitation              | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2630001 | Foundations of Networks and Mobile Systems*   | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2630002 | Foundations of Networks and Mobile Systems La | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2810001 | Design and Innovation*                        | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2810002 | Design and Innovation Lab*                    | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2945002 | Advanced Topics In Numerical Analysis: Numeri | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.3033046 | Special Topics: Statistical Natural Language  | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.3033076 | Special Topics: Vision Meets Machine Learning | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0002010 | Intro To Computer Programming (No Prior Exper | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0101002 | Intro To Computer Science                     | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0101009 | Intro To Computer Science                     | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0102009 | Data Structures - Recitation                  | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0102014 | Data Structures - Recitation                  | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0102015 | Data Structures - Recitation                  | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0201011 | Computer Systems Organization - Recitation    | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0201013 | Computer Systems Organization - Recitation    | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0201016 | Computer Systems Organization - Recitation    | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0201017 | Computer Systems Organization                 | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0480053 | Special Topics: iOS Programming               | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
+-----------------+-----------------------------------------------+--------------+-----------+--------------+-----------+------+----------+


# 4) show the number of courses taught by professor versoza in spring and fall 
SELECT Professor, COUNT(courseNumber) AS num_of_courses FROM Course WHERE Professor LIKE '%Versoza%';
+----------------+----------------------+
| Professor      | num_of_courses       |
+----------------+----------------------+
| Joseph Versoza |                    6 |
+----------------+----------------------+