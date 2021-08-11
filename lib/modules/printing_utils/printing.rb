# frozen_string_literal: true

# printing module
module Printing
  def print_feedback(feedback)
    return unless feedback

    print magenta('Received Feedback: ', bold: true)
    feedback[:correct_positions].times do |_|
      print "\u{1f7e2}"
    end
    feedback[:wrong_positions].times do |_|
      print "\u{1f7e0}"
    end

    print red('<No Feedbacks>') if feedback.all? { |_key, value| value.zero? }
    print "\n"
  end

  def print_answer(secret_code, guess)
    print "\n"
    print magenta('Secret Code: ', bold: true) + yellow(secret_code.to_s, bold: true)
    print cyan('  <======>  ')
    print magenta('Guess: ', bold: true) + yellow(guess.to_s, bold: true)
  end

  def print_score(score, maker, breaker, secret_code, _guess)
    print_answer(secret_code, guess)
    puts yellow("\n\nScores: ", bold: true)
    print cyan("#{maker.name}: #{score[maker.name]}", bold: true)
    print magenta('  <======>  ')
    puts cyan("#{breaker.name}: #{score[breaker.name]}", bold: true)
  end

  def print_winner(winner)
    print magenta('Winner: ', bold: true)
    print yellow(winner, bold: true)
    print "\n"
  end

  def print_round_number(round)
    print yellow("\n========================================")
    puts cyan("\nRound: #{round + 1}")
    puts yellow('========================================')
  end

  def print_move(count)
    print magenta("\nMove: ")
    print yellow((count + 1).to_s)
  end

  def print_players(maker, breaker)
    print cyan('Code Maker: ', bold: true)
    print yellow(maker.name)
    print magenta('  <====>  ', bold: true)
    print cyan('Code Breaker: ', bold: true)
    print yellow(breaker.name)
    puts
  end
end
