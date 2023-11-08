require "/home/#{%x(printf $USER)}/code/setup/services/backup_os/base.rb"
Dir["/home/#{%x(printf $USER)}/code/setup/services/backup_os/*.rb"].each do |file|
  require file unless file.match?(/backup_os\/base\.rb/)
end

module BackupOS
  def backup_settings!
    # todo need to add 1password settings for removing keyboard shortcuts (that cause conflicts)
    ::BackupOS::DconfSettings.new.backup! &&
      ::BackupOS::VscodeExtensions.new.backup! &&
      ::BackupOS::VscodeSettings.new.backup! &&
      ::BackupOS::VscodeKeybindings.new.backup!
  end
end
