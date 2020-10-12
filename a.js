leapYear = y => { return (y%4==0 && y%100!=0) || y%400==0 }

doomsday = (d, m, y) => {
    const codeM = [6,2,2,5,0,3,5,1,4,6,2,4];
    const codeY = [0,5,3,1];
    [cent, yr] = [Math.floor(y/100), y%100];
    leap = leapYear(y) && m<3? 1 : 0;
    return (d + codeM[m-1] + codeY[cent%4] + yr + Math.floor(yr/4) - leap) % 7;
}

// Try it!
console.log(doomsday(25,5,1810));   // 5
console.log(doomsday(1,1,2000));    // 6
console.log(doomsday(11,9,2001));   // 2
console.log(doomsday(7,10,2020));   // 3
console.log(doomsday(23,2,1927));	// 3
console.log(doomsday(6,9,1969));    // 6
console.log(doomsday(29,2,2020));   // 6

// Timing

let total_time = 0;
const MEASUREMENTS = 10;
const LOOPS = 1000;

for(let j=0; j<MEASUREMENTS; j++){
    console.time('Execution Time')
    for(let i=0; i<LOOPS; i++) doomsday(29,2,2020);
    let elapsed = console.timeEnd('Execution Time');
}