
# [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game))
This project is part of the [The Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/mastermind)'s Ruby curriculum.

## Table of Contents
* [Description](#description)
* [Demo](#demo)
* [Built With](#built-with)
* [Algorithm](#algorithm)
* [Rules](#rules)
* [Play Online](#play-online)
* [Play Local](#play-local)
* [What I learned](#what-i-learned)

## Description
This implementation of the **Mastermind** game is a **User vs Computer** type of game played in the Terminal. One will be the **Code Maker** and the other will be the **Code Breaker**. Code Maker will generate a **4 digit** number (Secret Code) where each digit contain a number between **1 to 6**. Code Breaker needs to guess the number by maximum **12** guesses. 
## Rules
* Code Breaker will be awarded with a feedback for each guess.
* Feedback will contain a green-circle if the user's guess contains the number from the Code Maker's code and also in the right place.
* Feedback will contain an orange-circle if the user's guess contains the number from the Code Maker's code but in the wrong place.
* No Feedback will be awarded if both guess and secret code are not have in common.
* For each guess Code Breaker take Code Maker will be awarded with one point.
* Totally even number of rounds will be played.
* At the end of all rounds whoever has the highest points wins.
* After each round players' roles switched from Maker to Breaker and vice-versa.
* Example of Valid Codes, 1111, 1234, 5552. Invalid Codes, 0011, 13435, 666113, abcd.
## Demo
![Example](./assets/example.gif)
</br>
## Built With
* Ruby
## Algorithm
Algorithm used for Computer Player's guessing is the **Swaszek** strategy. [Read more here](https://puzzling.stackexchange.com/a/8884)
## Play Online
[repl.it](https://replit.com/@TheGeek2/mastermind)
## Play Local
### prerequisites
You need to have Ruby locally. If you don't have, use [this](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/installing-ruby-ruby-programming) to install Ruby first.
### installation
```sh
git clone git@github.com:Maheshkumar-novice/Mastermind.git
```
```sh
cd Mastermind
```
```sh
ruby main.rb
```
## What I Learned
* How to think in OOP way
* How to make interactions between objects
* How to plan for a project
* How to organise code base
* How to split the project into small parts and combining them to make a working project
* How to print color text
* How to use unicode characters with Ruby
* How to create a good readme
