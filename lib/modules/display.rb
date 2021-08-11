# frozen_string_literal: true

require_relative './printing_utils/intro'
require_relative './printing_utils/colors'
require_relative './printing_utils/input_prompts'
require_relative './printing_utils/printing'
require_relative './printing_utils/info'

# Display Module
module Display
  include Intro
  include Colors
  include InputPrompts
  include Printing
  include Info
end
