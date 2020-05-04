# Fibonacci


Function to calculate the nth Fibonacci number using the [closed form](https://en.wikipedia.org/wiki/Fibonacci_number#Closed-form_expression). 
It uses the Ring Z(sqrt 5) so it can use arbritary precision arithmetic.

This function was created as exercise and I wouldn't use it in production, it also was never intended to be installed.

This implementation was discussed in  https://codereview.stackexchange.com/questions/241541/closed-form-fibonacci-using-integer

## building

I use stack. It builds with
```
stack build
```

## running 

I run it via `stack exec -- fibonacci-exe 123` - where 123 is a placeholder for the nth Fibonacci number. 

