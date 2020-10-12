codeM, codeY :: [Int]
codeM = [6,2,2,5,0,3,5,1,4,6,2,4]
codeY = [0,5,3,1]

leapYear :: Int -> Bool
leapYear y = (((mod y 4) == 0) && ((mod y 100) /= 0)) || (mod y 400) == 0
leap :: Int -> Int -> Int
leap y m
    | (leapYear y) && m<3 = 1
    | otherwise = 0
yearStuff :: Int -> Int
yearStuff year = (codeY !! cent) + (div yr 4) + yr
    where   cent = mod (div year 100) 4
            yr = mod year 100

doomsday :: Int -> Int -> Int -> Int
doomsday d m y = mod calculatedDay 7
    where   calculatedDay = d + (codeM !! (m-1)) + (yearStuff y) - (leap y m)

-- Try it!
-- doomsday 25 5 1810
-- 5
-- doomsday 1 1 2000
-- 6
-- doomsday 11 9 2001
-- 2
-- doomsday 7 10 2020
-- 3
-- doomsday 23 2 1927
-- 3
-- doomsday 6 9 1969
-- 6
-- doomsday 29 2 2020
-- 6