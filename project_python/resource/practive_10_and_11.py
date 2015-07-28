# -*- coding: utf-8 -*-
from sys import argv

script, filename=argv

print "Ban da co chac muon ghi len file: %r nay hong ta?" %filename
print "Muon hay khong thi ke ban gio la to di ghi file cho cau day. hihi"

abc=open(filename,'w')

print "Hi nhap vao cac dong chu ban muon ghi vao file nhe!"

abc.truncate()

line1=raw_input("Dong 1: ")
line2=raw_input("Dong 2: ")
line3=raw_input("Dong 3: ")
line4=raw_input("Dong 4: ")
line5=raw_input("Dong 5: ")

print "chung ta dang ghi vao file nhe!"

abc.write(line1)
abc.write("\n")
abc.write(line2)
abc.write("\n")
abc.write(line3)
abc.write("\n")
abc.write(line4)
abc.write("\n")
abc.write(line5)

print "Thong bao cho ban 1 tin vui la da ghi thanh cong roi nhe"

abc.close()

print "va gio chung ta print ra nhung gi chung ta vua nhap vao nhe"

reading_file=open(filename)

print "noi dung tung dong la:"

print reading_file.read()

reading_file.close()