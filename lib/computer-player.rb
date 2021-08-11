#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './player'
require_relative './guess'
require_relative './modules/display'

module Mastermind
  # Human Player Class
  class ComputerPlayer < Player
    include Display
    attr_accessor :current_guess, :guess

    def initialize
      super('Computer')
    end

    def make_code
      puts computer_code
      "#{rand(1..6)}#{rand(1..6)}#{rand(1..6)}#{rand(1..6)}"
    end

    def make_guess(feedback)
      init_guess if feedback.nil?
      print computer_guess
      self.current_guess = guess.create_guess(feedback, current_guess)
      puts current_guess
      current_guess
    end

    private

    def init_guess
      @guess = Guess.new
    end
  end
end
