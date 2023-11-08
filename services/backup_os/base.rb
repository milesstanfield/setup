require "/home/#{%x(printf $USER)}/code/setup/services/color.rb"

module BackupOS
  class Base
    include Color
  end
end
