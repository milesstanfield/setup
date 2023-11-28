require "#{%x(printf $HOME)}/code/setup/services/backup_os/base.rb"
Dir["#{%x(printf $HOME)}/code/setup/services/backup_os/*.rb"].each do |file|
  require file unless file.match?(/backup_os\/base\.rb/)
end

module BackupOS
  def backup_settings!
    ::BackupOS::DconfSettings.new.backup! &&
      ::BackupOS::VscodeExtensions.new.backup! &&
      ::BackupOS::VscodeSettings.new.backup! &&
      ::BackupOS::VscodeKeybindings.new.backup! &&
      ::BackupOS::OnePasswordSettings.new.backup!
  end
end
