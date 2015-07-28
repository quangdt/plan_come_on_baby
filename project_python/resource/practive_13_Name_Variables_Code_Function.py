# this one is like your scripts with argv
def print_two(*args):
	arg1,arg2=args
	print "tham so arg1: %r , tham so arg2: %r" %(arg1,arg2)

# Ok, that *args is actually pointless, we can just do this
def print_two_again(arg1,arg2):
	print "tham so arg1: %r , tham so arg2: %r" %(arg1,arg2)

#This one takes one arguments
def print_one(arg1):
	print "arg1: %r" %arg1	

#This one takes no arguments
def print_none():
	print "I got nothin'."

#bat dau print ra thui

print_two("abc","def")
print_two_again('tesst lai ham 2 tham so',"test lai ham hai tham so")
print_one("abcdefghijklm")
print_none()