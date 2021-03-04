import urllib.request, json
from configparser import ConfigParser

def get_config(fn):
	parser = ConfigParser()
	parser.read(fn)
	db = parser.items('db')
	return {name: value for name, value in db}

conf = get_config('apiconfig.ini')
api_key = conf['api_key']

domain = 'https://api.harvardartmuseums.org/'
objectid = '304069'
url = f'{domain}object/{objectid}?apikey={api_key}'

response = urllib.request.urlopen(url).read().decode('utf-8')
photos = json.loads(response)['images']

#retrieve all images with width less than 1000
for p in photos:
    if p['width'] < 1000:
        print(p['baseimageurl'] + "\n\n")
