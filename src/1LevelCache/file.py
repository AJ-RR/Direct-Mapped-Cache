filename = "gcc.trace"
output_file = open("gcc.txt","w+")
with open(filename) as file:
	a = []
	for line in file:
		a.append(line)
	for i in range(1,len(a)):
		a[i] = a[i][2:12]	
	a[0] = a[0][0:10]
	k=0		
	for i in a:
			if(k>100000):
				break
			print >>output_file,i
			
                        k+=1
