#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './feedback'

module Mastermind
  # Guess Class to Generate Computer Player Guesses
  class Knuth
    attr_reader :init_guess
    attr_accessor :feedback_creator, :total_codes, :knuth_codes, :possible_codes

    def initialize
      @init_guess = 1122
      @total_codes = [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a.map { |x| x.join.to_i } - [init_guess]
      @knuth_codes = total_codes
      @possible_codes = total_codes
      @feedback_creator = Feedback.new
    end

    def create_guess(feedback_hash, code)
      puts 'Knuth'
      return @init_guess unless feedback_hash

      eliminate(feedback_hash, code)
      get_code
    end

    def get_code
      guess_codes = minimax
      code = from_list(guess_codes)
      possible_codes.delete(code)
      code.to_s
    end

    def from_list(guess_codes)
      knuth_codes.each do |val|
        return val if guess_codes.include?(val)
      end
      guess_codes[0]
    end

    def minimax
      times_found = Hash.new(0)
      scores = {}
      guess_codes = []
      possible_codes.each do |code|
        knuth_codes.each do |code_to_crack|
          feedback = feedback_creator.give_feedback(code_to_crack, code)
          times_found[feedback.to_s] += 1
        end
        maximum = times_found.max_by { |_k, v| v }
        scores[code] = maximum[1]
      end
      minimum = scores.min_by { |_k, v| v }[1]

      possible_codes.each do |code|
        guess_codes << code if scores[code] == minimum
      end
      p guess_codes
      guess_codes
    end

    private

    def eliminate(feedback_hash, guess)
      knuth_codes.select! do |value|
        feedback_creator.give_feedback(guess, value) == feedback_hash
      end
    end
  end
end
