#!/usr/bin/python3  
from datetime import datetime, timedelta

shift_rotation = ['d','d','n','n','o','o','o','o']
days_off = ['v'] * 10

jan1 = datetime(2019,1,1)
now = datetime.now()

rnd = shift_rotation * 5
rnd = rnd + days_off
year_rnd = rnd * 20

shift_names = ['A','B','C','D','E']

offsetA = 35
offsetB = 25
offsetC = 5
offsetD = 45
offsetE = 15

shift_list = []
# print('Daynum, Date, A, B, C, D, E')
for d in range(0,1100):
  doy = jan1 + timedelta(days=d)
  daylist = [year_rnd[d+offsetA], year_rnd[d+offsetB], year_rnd[d+offsetC], year_rnd[d+offsetD], year_rnd[d+offsetE], d, doy.strftime("%Y-%m-%d")]
  day_night = [d, doy.strftime("%Y-%m-%d"), shift_names[daylist.index('d')], shift_names[daylist.index('n')]]
  shift_list.append(day_night)
  # print(daylist, day_night)

day_of_year = datetime.now().timetuple().tm_yday + 730

print('Shift Schedule')
for d in range(day_of_year-7, day_of_year):
	print('{}: {}'.format(d, shift_list[d-1]))
print('-----------')
for d in range(day_of_year, day_of_year+10):
	print('{}: {}'.format(d, shift_list[d-1]))
