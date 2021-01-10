from bs4 import BeautifulSoup, Comment
import requests
from datetime import datetime, date, timedelta
import os

url = input('Enter the url of the facebook event you want to add to your calendar:\n')
calendars = os.popen('gcalcli list').read()
calendars_split = calendars.splitlines()
for i, line in enumerate(calendars_split):
	if(i > 1 and i < len(calendars_split)-1):
		print(str(i-1)+". " + line)
	else:
		print(line)
calendar_line = input('choose which number calendar to add to: ')

calendar = calendars_split[int(calendar_line)+1].split()[2:]
#print(calendar)

page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')
title = soup.find(id="seo_h1_tag").get_text()
location = date_ = time = duration = None
for comments in soup.findAll(text=lambda text:isinstance(text,Comment)):
	comment_soup = BeautifulSoup(str(comments.extract()), 'html.parser')
	#print(comment_soup.prettify())
	event_data = comment_soup.find_all('div', class_='_xkh')
	for i, event in enumerate(event_data):
		#print(i)
		#print(event)
		#print(event.get_text())
		if (i == 0):
			date_time = event.find('div',class_='_2ycp _5xhk')['content']
			#print(date_time)
			[start_time, end_time] = date_time.split(' to ')
			#print(start_time)
			#print(end_time)
			[date_ , time] = start_time.split('T')
			[time, garbage] = time.split('-')
			#print(date_ + " " + time)		
			[garbage, time_end] = end_time.split('T')
			[time_end, garbage] = time_end.split('-')
			date_time_obj1 = datetime.strptime(date_ + " " + time, '%Y-%m-%d %H:%M:%S')
			date_time_obj2 = datetime.strptime(date_ + " " + time_end, '%Y-%m-%d %H:%M:%S')
			duration = date_time_obj2 - date_time_obj1
			#duration = datetime.combine(date.min, date_time_obj2.time) - datetime.combine(date.min, date_ime_obj1.time)	
			duration = int(duration.total_seconds()/60)
			date_time_obj1 += timedelta(hours=3)
			#print(str(date_time_obj1))
		elif (i == 1):
			location = event.get_text()

#print("answers:")
#print(title)
#print(location)
#print(date_ + " " + time)
#print(duration)	
my_command = 'gcalcli --calendar \''+" ".join(calendar)+'\' add --title \''+title+'\' --where \''+location+'\' --when \''+str(date_time_obj1)+'\' --description \''+url+'\' --duration \''+str(duration)+'\''
print(my_command)
os.system(my_command)
