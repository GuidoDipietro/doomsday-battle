#include <stdio.h>
#include <time.h>

short int codeM[12] = {6, 2, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};
short int codeY[4] = {0, 5, 3, 1};

int leapYear(int y) { return (!(y%4) && y%100) || !(y%400); }

int doomsday(int d, int m, int y){
    short int yr = y%100;
    short int leap = leapYear(y) && m<3? 1 : 0;
    return (d+codeM[m-1]+codeY[(y/100)%4]+yr+yr/4-leap)%7;
}

int main(){
    // Try it!
    printf("%d\n", doomsday(25,5,1810));    // 5
    printf("%d\n", doomsday(1,1,2000));     // 6
    printf("%d\n", doomsday(11,9,2001));    // 2
    printf("%d\n", doomsday(7,10,2020));    // 3
    printf("%d\n", doomsday(23,2,1927));	// 3
    printf("%d\n", doomsday(6,9,1969));     // 6
    printf("%d\n", doomsday(29,2,2020));    // 6

    // Timing

    struct timespec start, end;
    double all_times;
    #define MEASUREMENTS 1000
    #define LOOPS 10000

    for(int i=0; i<MEASUREMENTS; i++){
        clock_gettime(CLOCK_MONOTONIC, &start);

        for(int i=0; i<LOOPS; i++) doomsday(29,2,2020);

        clock_gettime(CLOCK_MONOTONIC, &end); 
    
        double time_taken; 
        time_taken = (end.tv_sec - start.tv_sec) * 1e9; 
        time_taken = (time_taken + (end.tv_nsec - start.tv_nsec)) * 1e-9;
        all_times += time_taken;
    }
    printf("Mean execution time (%d loops, %d measurements): %f\n", LOOPS, MEASUREMENTS, all_times/MEASUREMENTS);

    return 0;
}