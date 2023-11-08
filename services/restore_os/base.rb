require "/home/#{%x(printf $USER)}/code/setup/services/color.rb"

module RestoreOS
  class Base
    include Color
  end
end
