# frozen_string_literal: true

# input prompts module
module InputPrompts
  def code_input(name)
    yellow("\nEnter The Secret Code ") + cyan("<#{name}> : ")
  end

  def code_guess(name)
    yellow("\nEnter Your Guess ") + cyan("<#{name}> : ")
  end

  def games_prompt
    yellow("Enter the number of rounds you want to play #{cyan('(even number)')} > ")
  end

  def maker_or_breaker
    yellow("Do you want to be #{magenta('Code Maker')} or #{magenta('Code Breaker')} #{cyan('(0 or 1)')} > ")
  end

  def computer_guess
    yellow("\nComputer's Guess(Secret Code) > ")
  end

  def name_prompt
    yellow('Enter Your Name > ')
  end
end
