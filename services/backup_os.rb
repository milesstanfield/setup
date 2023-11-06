Dir["/home/milesstanfield/code/setup/services/backup_os/*.rb"].each {|file| require file }

module BackupOS
  def backup_settings!
    ::BackupOS::DconfSettings.new.backup! &&
      ::BackupOS::VscodeExtensions.new.backup! &&
      ::BackupOS::VscodeSettings.new.backup! &&
      ::BackupOS::VscodeKeybindings.new.backup!
  end
end
