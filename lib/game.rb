#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './computer-player'
require_relative './human-player'
require_relative './feedback'
require_relative './modules/display'

module Mastermind
  # Game class to control the flow of the game
  class Game
    include Display
    attr_accessor :maker, :breaker, :score, :secret_code, :guess, :feedback, :feedback_creator, :number_of_games

    def initialize
      @score = Hash.new(0)
      @feedback_creator = Feedback.new
    end

    def start
      puts intro
      self.number_of_games = total_games
      create_players
      play_rounds
      announce_winner
    end

    private

    def play_rounds
      number_of_games.times do |round|
        print_round_number(round)
        print_players(maker, breaker)
        play
        self.maker, self.breaker = breaker, maker
        self.feedback = nil
      end
    end

    def play
      self.secret_code = maker.make_code
      12.times do |counter|
        print_move(counter)
        set_guess
        create_feedback
        score[maker.name] += 1
        break if winner?

        announce_failed if counter == 11
        sleep 0.75
      end
    end

    def create_players
      print maker_or_breaker
      user_choice = choose_choice
      if user_choice.zero?
        self.maker = create_human_player
        self.breaker = Mastermind::ComputerPlayer.new
      elsif user_choice == 1
        self.maker = Mastermind::ComputerPlayer.new
        self.breaker = create_human_player
      end
    end

    def create_human_player
      human = Mastermind::HumanPlayer.new('Fury')
      print name_prompt
      human.name = gets.chomp
      human.name = 'Fury' if human.name.length.zero?
      human
    end

    def create_feedback
      self.feedback = feedback_creator.give_feedback(guess, secret_code)
      print_feedback(feedback)
    end

    def total_games
      print games_prompt
      number_of_games = gets.chomp.to_i
      until valid_number_of_games?(number_of_games)
        print error(games_prompt)
        number_of_games = gets.chomp.to_i
      end
      number_of_games
    end

    def choose_choice
      user_choice = gets.chomp
      until %w[0 1].include?(user_choice)
        print error(maker_or_breaker)
        user_choice = gets.chomp
      end
      user_choice.to_i
    end

    def set_guess
      self.guess = breaker.make_guess(feedback)
    end

    def announce_winner
      if score[maker.name] == score[breaker.name]
        puts 'Draw!'
        return
      end
      print_winner(score.key(score.values.max))
    end

    def announce_failed
      puts red('Code Not Broken!', bold: true)
      print_score(score, maker, breaker, secret_code, guess)
    end

    def announce_win
      puts cyan('Code Broken!', bold: true)
      print_score(score, maker, breaker, secret_code, guess)
    end

    def winner?
      if secret_code == guess
        announce_win
        return true
      end

      false
    end

    def valid_number_of_games?(number)
      return false if number.zero? || number.odd?

      true
    end
  end
end
