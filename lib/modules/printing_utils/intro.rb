# frozen_string_literal: true

# Intro Module
module Intro
  def welcome
    puts magenta('Welcome To Mastermind!', bold: true)
    puts "\n"
  end

  def basic_rules
    puts yellow('Players => Code Maker & Code Breaker (Alternatively).', bold: true)
    puts cyan('Even number of Rounds will be played.', bold: true)
    puts yellow("Code Breaker need to guess the Code Maker's Secret in 10 or less guesses.", bold: true)
    puts cyan('For Each guess Code Breaker take Code Maker will be awarded with one point.', bold: true)
    puts yellow('For Each guess Code Breaker take feedback will be given.', bold: true)
    puts cyan('At the end of all rounds, Whoever has the highest points wins.', bold: true)
    puts yellow('Code will be 4 digits as well as Guess.', bold: true)
    puts cyan('Each digit will contain numbers from 1 to 6. Example: 1234, 6666, 3123', bold: true)
    puts "\n"
  end

  def feedback
    puts magenta('If the Guess contains a digit from Secret and in the right place, feedback will contain 🟢',
                 bold: true)
    puts cyan('If the Guess contains a digit from Secret but in the wrong place, feedback will contain 🟠', bold: true)
    puts yellow("If no digits from Guess contains Secret's digits, then feedback will be <No Feedback>", bold: true)
    puts "\n"
  end

  def intro
    welcome
    basic_rules
    feedback
  end
end
