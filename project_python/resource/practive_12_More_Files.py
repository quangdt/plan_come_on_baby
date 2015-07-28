from sys import argv
from os.path import exists

script, from_file, to_file=argv

print "Coping from %s to %s" %(from_file,to_file)

# chung ta se lam 2 trong 1 dong nhu the nao?
in_file=open(from_file)
indata=in_file.read()

print "File dau vao co %d byte long" %len(indata)
print "Kiem tra file dau ra da ton tai chua? %r" %exists(to_file)
print "San sang, nhan ENTER de tiep tuc, CTRL-C de bao cao."

raw_input("?")

out_file=open(to_file,'w')
out_file.write(indata)

print "Dung, tat ca da xong"

out_file.close()
in_file.close()

read_file=open(to_file)
print "Va file %r sau khi copy nhu the nao nhi?" %to_file

print read_file.read()