#!/usr/bin/python3  
from collections import namedtuple, deque
from datetime import datetime, timedelta

def shift_list(n):
    rnd = list(('d','d','n','n','o','o','o','o') * 5 + tuple(['v'] * 10))
    return rnd[n:] + rnd[:n]

A = shift_list(-34)
B = shift_list(-44)
C = shift_list(-14)
D = shift_list(-24)
E = shift_list(-4)
shifts = [A, B, C, D, E]
shift_names = ['A', 'B', 'C', 'D', 'E']

def shift_of_date(dt):
    doy = dt.timetuple().tm_yday 
    hour = dt.hour
    millhour = hour - 5
    shiftList = [shift[doy%50 -1] for shift in shifts]
    d = shiftList.index('d')
    n = shiftList.index('n')
    if hour > 4 and hour < 17:
        return shift_names[d]
    elif hour < 5:
        shiftList = [shift[doy%50 -2] for shift in shifts]
        n = shiftList.index('n')
        return shift_names[n]
    else:
        return shift_names[n]

if __name__ == '__main__':

    now = datetime.now()
    print(now.strftime('%Y-%m-%d %H:%M:%S'), shift_of_date(now))

    dd = datetime(2021, 9, 28, 5, 10)
    print(dd, shift_of_date(dd))

    dd = datetime(2021, 1, 15, 5, 10)
    print(dd, shift_of_date(dd))

    dd = datetime(2021, 1, 1, 5, 10)
    print(dd, shift_of_date(dd))

    for d in range(6):
        ds = now.replace(hour=7) + timedelta(days=d)
        ns = now.replace(hour=19) + timedelta(days=d)
#        print(ds.strftime('%Y-%m-%d'), shift_of_date(ds), shift_of_date(ns))
        print(f'{ds.strftime("%Y-%m-%d")}   {shift_of_date(ds)}   {shift_of_date(ns)}')
