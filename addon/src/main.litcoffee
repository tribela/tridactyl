# main.litcoffee

## Introduction

We're writing everything in CoffeeScript v2: http://coffeescript.org/v2/
You can install it with `npm install --global coffeescript@next`. You need Firefox version 52+ to use the `await` command we are using here.

Functions declared in any of the background scripts can be called in the debug window in ff.

## Modulus

Modulus that always returns a non-negative number, as mathematicians expect.

In mathematics, mod usually returns the remainder of euclidean division of
two numbers and the remainder is always positive.

In most programming languages, mod can return a negative number and the
return value of mod always matches the sign of one or the other of the
arguments. In JS the built-in % operator's returned value always has the same
sign as the dividend, in python, the divisor.

    Number.prototype.mod = (n) ->
        Math.abs(this % n)

Let the console know we got home safely.

    console.log("Loaded Tridactyl")
