# frozen_string_literal: true

# colors module
module Colors
  def error(str)
    red("Invalid Input! #{str}")
  end

  def red(str, bold: false)
    return "\e[1;31m#{str}\e[0m" if bold

    "\e[31m#{str}\e[0m"
  end

  def cyan(str, bold: false)
    return "\e[1;36m#{str}\e[0m" if bold

    "\e[36m#{str}\e[0m"
  end

  def magenta(str, bold: false)
    return "\e[1;35m#{str}\e[0m" if bold

    "\e[35m#{str}\e[0m"
  end

  def yellow(str, bold: false)
    return "\e[1;33m#{str}\e[0m" if bold

    "\e[33m#{str}\e[0m"
  end

  def black(str)
    "\e[30m#{str}\e[0m"
  end

  def yellow_bg(str)
    "\e[43m#{str}\e[0m"
  end
end
