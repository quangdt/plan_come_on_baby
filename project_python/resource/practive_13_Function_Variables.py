def cheese_and_crackers(chees_count,boxes_of_crackers):
	print "You have %d cheese!" % chees_count
	print "You have %d boxes of crackers!" %boxes_of_crackers
	print "Man that's enough for a party!"
	print "Get a blanket.\n"


print "We can just give the function numbers directly:"
cheese_and_crackers(20,30)

print "Ok, we can use variables from our script:"
amount_of_cheese=10
amount_of_crackers=50

cheese_and_crackers(amount_of_cheese,amount_of_crackers)

print "We can even do math inside too:"
cheese_and_crackers(amount_of_cheese+456,amount_of_cheese-567)

