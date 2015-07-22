my_name='Zed A. Shaw'
my_age=35 #not a lie
my_heigh=74 #inches
my_weight=180 #lbs
my_eyes='Blue'
my_teeth='White'
my_hair='Brown'

print "Let's talk about %s." %my_name
print "He's %d inches tall." % my_heigh
print "He's %d pounds heavy." %my_weight
print "Actually that's not too heavy."
print "He's got %r eyes and %r hair." %(my_eyes,my_hair)
print "His teeth are usually %s denpending on the coffee." %my_teeth

#this line is tricky, try to get it exactly right
print "If I add %d, %d, and %d I get %d." %(my_age,my_heigh,my_weight,my_weight+my_heigh+my_age)