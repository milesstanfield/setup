module Color
  def warn(str)
    puts yellow(str)
    true
  end

  def error(str)
    puts red(str)
    true
  end

  def success(str)
    puts light_blue(str)
    true
  end

  # ------------------------------------------------------------

  def red(str)
    colorize(31, str)
  end

  def green(str)
    colorize(32, str)
  end

  def yellow(str)
    colorize(33, str)
  end

  def blue(str)
    colorize(34, str)
  end

  def pink(str)
    colorize(35, str)
  end

  def light_blue(str)
    colorize(36, str)
  end

  def colorize(color_code, str)
    "\e[#{color_code}m#{str}\e[0m"
  end
end
