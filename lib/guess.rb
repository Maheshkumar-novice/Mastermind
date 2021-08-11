#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './feedback'

module Mastermind
  # Guess Class to Generate Computer Player Guesses
  class Guess
    attr_reader :init_guess
    attr_accessor :feedback_creator, :candidates

    def initialize
      @init_guess = 1122
      @candidates = [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a.map { |x| x.join.to_i } - [init_guess]
      @feedback_creator = Feedback.new
    end

    def create_guess(feedback_hash, guess)
      return init_guess.to_s unless feedback_hash

      eliminate(feedback_hash, guess)
      candidates.shift.to_s
    end

    private

    def eliminate(feedback_hash, guess)
      candidates.select! do |value|
        feedback_creator.give_feedback(guess, value) == feedback_hash
      end
    end
  end
end
