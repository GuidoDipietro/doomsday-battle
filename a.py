import time

def doomsday(d, m, y):
	codeM = [6, 2, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4]
	codeY = [0, 5, 3, 1]
	leap = lambda y: (y%4==0 and y%100!=0) or y%400==0

	leap = 1 if leap(y) and m<3 else 0
	cent, yr = y//100, y%100
	return (d + codeM[m-1] + codeY[cent%4]  + yr + yr//4 - leap) % 7

# Try it!
print(doomsday(25,5,1810)) 	# 5
print(doomsday(1,1,2000)) 	# 6
print(doomsday(11,9,2001))	# 2
print(doomsday(7,10,2020))	# 3
print(doomsday(23,2,1927))	# 3
print(doomsday(6,9,1969))	# 6
print(doomsday(29,2,2020))	# 6

# Ok, technically this can be a "one-liner":
# doomsday2 = lambda d, m, y: datetime.datetime(y, m, d).weekday() # 0 = monday
# But that's cheating! Also you need an import

all_times = 0
LOOPS = 1000
MEASUREMENTS = 1000

for p in range(MEASUREMENTS):
	now = time.time()
	for i in range(LOOPS): doomsday(29,2,2020)
	done = time.time()
	all_times += (done-now)

print(all_times/MEASUREMENTS)
# 0.0007938778400421142 ~= 790 ns per doomsday() call