object calendar {
	const codeM = [6, 2, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4]
	const codeY = [0, 5, 3, 1]
	
	method doomsday(d, m, y){
		const cent = (y.div(100))%4
		const yr = y%100
		const leap = if (self.leapYear(y) && m<3) 1 else 0
		return (d + codeM.get(m-1) + codeY.get(cent) + yr + yr.div(4) - leap) % 7
	}
	method leapYear(y) = (y%4==0 && y%100!=0) || y%400==0
	// One-liner alternative using the Date class:
	 method doomsday2(d,m,y) = new Date(day=d,month=m,year=y).internalDayOfWeek()
}

// Try it!
// calendar.doomsday(25,5,1810)   // 5
// calendar.doomsday(1,1,2000)    // 6
// calendar.doomsday(11,9,2001)   // 2
// calendar.doomsday(7,10,2020)   // 3
// calendar.doomsday(23,2,1927)   // 3
// calendar.doomsday(6,9,1969)    // 6
// calendar.doomsday(29,2,2020)   // 6

// Couldn't benchmark in this language... It is designed just to teach OOP, so yeah.