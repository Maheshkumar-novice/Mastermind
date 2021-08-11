#!/usr/bin/env ruby
# frozen_string_literal: true

module Mastermind
  # Feedback class to generate feedbacks on guesses
  class Feedback
    attr_accessor :code, :guess, :feedback_hash

    def give_feedback(code, guess)
      @feedback_hash = {
        correct_positions: 0,
        wrong_positions: 0
      }
      @code = convert(code)
      @guess = convert(guess)
      eliminate_positions
      feedback_hash
    end

    private

    def convert(value)
      value.to_s.split('')
    end

    def delete_indexes(indexes, array)
      array.reject!.with_index { |_value, index| indexes.include? index }
    end

    def deal_correct_positions
      indexes_to_delete = []
      guess.each_with_index do |_char, index|
        next unless guess[index] == code[index]

        feedback_hash[:correct_positions] += 1
        indexes_to_delete.push(index)
      end
      delete_indexes(indexes_to_delete, code)
      delete_indexes(indexes_to_delete, guess)
    end

    def deal_wrong_positions
      guess.each do |value|
        next unless code.include?(value)

        code.delete_at(code.index(value))
        feedback_hash[:wrong_positions] += 1
      end
    end

    def eliminate_positions
      deal_correct_positions
      deal_wrong_positions
    end
  end
end
