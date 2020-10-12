# Doomsday algorithm battle 🗓
Algorithm that calculates the weekday of a given date in the Gregorian calendar, implemented in [Python](https://www.python.org/), [Haskell](https://www.haskell.org/), [C](https://en.wikipedia.org/wiki/C_(programming_language)), [JavaScript](https://www.javascript.com/), [Wollok](https://www.wollok.org/en/), [Prolog](https://www.swi-prolog.org/), [Julia](https://julialang.org/), and [CheLang](https://github.com/frankdilu/CheLang).  
What highlights from each of them?

# The algorithm
You get the weekday by adding up all these numbers:
- **The day** (i.e. for August 18th 2049 it is 18)
- **The month code** (being 6, 2, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4, from January to December)
- **The "century" code** (mod 4) (first 2 digits of the year number, i.e. for 2014 it is 20)
    - Codes are 0, 5, 3, 1 for 0, 1, 2, 3 (mod 4)
- **The "year"** (last 2 digits of the year number, i.e. for 1984 it is 84)
- **The "year" divided by 4** (rounded down)
- **Substract 1** if the year is a leap year, and if the month is January or February
    - Leap years are those which are a multiple of 4 and not of 100, or else, a multiple of 400

Then, you take modulo 7 of all that, and you find the weekday as:
- 0 = Sunday
- 1 = Monday
- ...
- 6 = Saturday

As you can see, it is very simple to implement. It can even be calculated mentally in a few seconds [(or less)](https://www.youtube.com/watch?v=Vxa20NTAE0c) with enough practice.

# Who won? 🤔
Let's make a battle!
## By lines of code
Let's count non-empty lines relevant to the algorithm!  
By the way, many of these programs can be reduced a lot, but I tried to code as naturally as possible in all of them and keep things readable.  
Also, I am not excellent in these languages, so you can expect to see some sub-optimal code here and there 😜

- **Python** - 7 lines
- **Julia** - 8 lines
- **JavaScript** - 8 lines
- **C** - 8 lines
- **Wollok** - 11 lines
- **Haskell** - 16 lines (5 are just type declarations, so it's probably better to say 11 😀)
- **CheLang** - 20 lines
- **Prolog** - 34 lines (the knowledge base really killed it)

There is a triple tie for the second place, and a perhaps double tie for the third! Also, JavaScript and Julia both have 1 line that only serves as code block finish (`end` and `}`)... How unfortunate 😥  

Let's try to break those ties.

## By number of characters
Maybe some use more lines, but less characters... Let's see who gets favoured if we only count non-blank characters!

I will use the same variable names for those that stand a chance at being high in the rankings (sorry about that, Prolog, CheLang...)

- **Python** - 203 characters
- **Julia** - 210 characters
- **JavaScript** - 250 characters
- **C** - 255 characters
- **Wollok** - 279 characters
- **Haskell** - 404 characters - 301 without type declarations (ouch)
- **Prolog** - 505 characters
- **CheLang** - 595 characters (phew!)

The ties are broken! However... C uses the `short int` declarations 4 times, which could just be changed to `int` to shave off 20 characters and beat JavaScript!

In any case, the winner here turns out to be **Python**, however **Julia** comes really, really close to it. Removing the `const` declarations in Julia would make it beat Python (and still outperform it in execution time 🤫) but we're leaving them just so that the victory in the next section is as crushing as it is. (spoilers!!)

Finally, CheLang comes last here, despite it having 14 lines less than Prolog, due to its highly verbose _argento slang_ syntax, which also makes the language so beautiful.

## By execution time
Ok, but many of these programs are already really similar. Python, Julia, C, JavaScript, Wollok, all seem to be basically the same thing just with different syntax...

Let's have some fun ~~no, it's terrible~~ benchmarking these functions/methods/predicates in every language! ~~why~~

- Julia - 2.199 ns ‼
- C - 9 ns
- JavaScript - 396 ns
- Python - 790 ns
- Prolog - about 2 µs ~= 2000 ns
- CheLang - about 484 µs ~= 484000 ns
- Haskell - couldn't get it working...
- Wollok - there is literally no way to do it

Wow. Julia beat everyone here, end of discussion. 🎉  
Even measuring the time was much simpler than in any of the other 7 languages: just import a library and call the function with the `@btime` macro, and that's all.

C did extremely well in speed, as it's usual, but Julia... it's just crazy.

I'm quite disappointed with Python and Prolog in this task, and with myself for not being able to deal with timing stuff in Haskell (gosh, stack is really harsh).

# Awards ceremony 🏅

### Shortest code
In the "shortest code" category, the winner is **Python**, for winning both in number of lines and number of characters, with **Julia** in the second place, for just having 1 more line than Python because of a single keyword, and not beating Python in number of characters _just because she's too kind_.  
In the third place, we have **JavaScript**, with also 1 more line that only has **one character**. What a waste! The number of characters in JavaScript altogether is quite higher than the first two places, though.

A notable mention to **Wollok**, for being just a teaching language yet being able to come rather high in the rankings!

### Fastest code
In the "fastest code" category, the winner is obviously **Julia**, with a really close second place of **C**, who both ridiculously outperformed every other language by a huge margin.  
There is no third place, since everyone else was terribly slow in comparison. Sorry for that, JavaScript.

A consolation prize is awarded here to **CheLang**, since even though its runtime was the slowest of them all (being like 250,000 times slower than Julia 🤣), it was possible to find a workaround to benchmark a function, even it being a meme language. That was quite satisfying I gotta admit!

### Most elegant code

Finally, in the "most elegant code" category, the winner _has_ to be **Julia** again. This is just personal preference, but look at this: `÷` symbol used for integer division? Just one macro `@btime` used to benchmark efficiently and accurately? Functions defined casually as `f(x) = stuff with x`, as if I were writing random math notes? And it is extremely fast too? I just can't help but be charmed at that code.

### Final words

I'm quite sorry to not see Haskell in any of these awards, since it is such an amazing language that I like a lot. I will highlight from it that I like very much how the _doomsday_ function is called: `doomsday 29 2 2020`, no parenthesis anywhere. That is very clean and I like it.

Also, a pity for Prolog, but this is not really the use for this language. Maybe my code was terrible, my apologies to the little owl! 🦉

# Would you like to contribute?

Adding languages to this battle is welcome! Make your pull request, or an issue perhaps.  

Also, improvements or suggestions for any of the 8 languages that are already featured is always appreciated.

Thanks for the read 🤙