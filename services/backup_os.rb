require "/home/#{%x(printf $USER)}/code/setup/services/backup_os/base.rb"
Dir["/home/#{%x(printf $USER)}/code/setup/services/backup_os/*.rb"].each do |file|
  require file unless file.match?(/backup_os\/base\.rb/)
end

module BackupOS
  def backup_settings!
    # todo add 1password
    ::BackupOS::DconfSettings.new.backup! &&
      ::BackupOS::VscodeExtensions.new.backup! &&
      ::BackupOS::VscodeSettings.new.backup! &&
      ::BackupOS::VscodeKeybindings.new.backup!
  end
end
