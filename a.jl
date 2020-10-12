using BenchmarkTools

# Declared as const for better performance
const codeM = [6,2,2,5,0,3,5,1,4,6,2,4]
const codeY = [0,5,3,1]
function doomsday(d,m,y)
    cent, yr = (y÷100)%4, y%100
    leapYear(y) = (y%4==0 && y%100≠0) || y%400==0
    leap = m<3 && leapYear(y) ? 1 : 0
    (d + codeM[m] + codeY[cent+1] + yr + yr÷4 - leap) % 7
end

function printall()
    println(doomsday(25,5,1810)) 	# 5
    println(doomsday(1,1,2000)) 	# 6
    println(doomsday(11,9,2001))	# 2
    println(doomsday(7,10,2020))	# 3
    println(doomsday(23,2,1927))	# 3
    println(doomsday(6,9,1969))	    # 6
    println(doomsday(29,2,2020))	# 6
end

@btime doomsday(29,2,2020)