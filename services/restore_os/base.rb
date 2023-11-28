require "#{%x(printf $HOME)}/code/setup/services/color.rb"

module RestoreOS
  class Base
    include Color
  end
end
