% Month and Century codes %
codeM(1,6).
codeM(2,2).
codeM(3,2).
codeM(4,5).
codeM(5,0).
codeM(6,3).
codeM(7,5).
codeM(8,1).
codeM(9,4).
codeM(10,6).
codeM(11,2).
codeM(12,4).

codeY(0,0).
codeY(1,5).
codeY(2,3).
codeY(3,1).

% Helper Predicates %
sepYear(Y, Cent, Year):-
    Cent is Y div 100,
    Year is Y mod 100.
leapYear(Y):-
    (0 is Y mod 4, Y mod 100 \= 0);
    0 is Y mod 400.
leap(M, Y, 1):-
    leapYear(Y), M<3.
leap(M, Y, 0):-
    not((leapYear(Y), M<3)).

% Doomsday Algorithm %
doomsday(D, M, Y, W):-
    sepYear(Y, Cent, Year),
    ModYear is Year div 4,
    ModCent is Cent mod 4,
    codeM(M, Cm), codeY(ModCent, Cy),
    leap(M, Y, Leap),
    Day is (D + Cm + Cy + Year + ModYear - Leap),
    W is Day mod 7.

% Try it!
% doomsday(25, 5, 1810, X).
% X = 5.
% doomsday(1, 1, 2000, X).
% X = 6.
% doomsday(11, 9, 2001, X).
% X = 2.
% doomsday(7, 10, 2020, X).
% X = 3.
% doomsday(23, 2, 1927, X).
% X = 3.
% doomsday(6, 9, 1969, X).
% X = 6.
% doomsday(29, 2, 2020, X).
% X = 6.

% Benchmarking in the cheapest possibe way

manyDoomsdays():-
    doomsday(29,2,2020,X).
    % copy and paste ^that line (with a ,) 999 more times :D

stats():-
    statistics(walltime, [TimeSinceStart | [TimeSinceLastCall]]),
    manyDoomsdays(),
    statistics(walltime, [NewTimeSinceStart | [ExecutionTime]]),
    write('Execution took '), write(ExecutionTime), write(' ms.'), nl.