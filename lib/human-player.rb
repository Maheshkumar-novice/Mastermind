#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './player'
require_relative './modules/display'

module Mastermind
  # Human Player Class
  class HumanPlayer < Player
    include Display
    attr_accessor :name

    def make_code
      create_code
    end

    def make_guess(_feedback)
      create_guess
    end

    private

    def create_code
      print code_input(name)
      code = gets.chomp
      until valid_code?(code)
        print error(code_input(name))
        code = gets.chomp
      end
      code
    end

    def create_guess
      print code_guess(name)
      code = gets.chomp
      until valid_code?(code)
        print error(code_guess(name))
        code = gets.chomp
      end
      code
    end

    def valid_code?(code)
      return true if code =~ /^[1-6]{4}$/

      false
    end
  end
end
