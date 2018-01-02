# -*- coding: utf-8 -*-
"""
Created on Fri Dec 29 23:24:58 2017

@author: Saminah Kausar
"""
# 1990 first january was monday
# compute the first day of user input year
days = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'
'Sunday']
year = int(input("Enter the year: "))
years = year - 1990
leap_years = (years-2)//4 + 1
remaining = years - leap_years
days_offset = leap_years *2 + remaining
index = days_offset % 7
print(days[index])
