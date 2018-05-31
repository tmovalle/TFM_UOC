########

import sys

def intronSizes ():
  # with open(Input) as input:
	myNumb = 0
	# for line in input:
	for line in sys.stdin:
		theLine = line.strip().split('\t')
		theLine = [int(i) for i in theLine]

		numb = max(theLine)
		if numb > myNumb:
			myNumb = numb
	print (myNumb)


try:
	intronSizes()
except IOError:
	try:
		sys.stdout.close()
	except IOError:
		pass
	try:
		sys.stderr.close()
	except IOError:
		pass