require "#{%x(printf $HOME)}/code/setup/services/color.rb"

module BackupOS
  class Base
    include Color
  end
end
