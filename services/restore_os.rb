require "/home/#{%x(printf $USER)}/code/setup/services/restore_os/base.rb"
Dir["/home/#{%x(printf $USER)}/code/setup/services/restore_os/*.rb"].each do |file|
  require file unless file.match?(/restore_os\/base\.rb/)
end

module RestoreOS
  def restore_dependencies!
    system("sudo apt-get update") &&
      ::RestoreOS::AptDeps.new.install! &&
      ::RestoreOS::FlatpakDeps.new.install! &&
      ::RestoreOS::OnePasswordInstaller.new.install!
  end

  def restore_settings!
    ::RestoreOS::DconfSettings.new.load! &&
      ::RestoreOS::VscodeExtensions.new.install! &&
      # load vscode settings and keybindings after installing vscode extensions cuz
      # there could be settings and keybindings specific to an extension
      ::RestoreOS::VscodeSettings.new.load! &&
      ::RestoreOS::VscodeKeybindings.new.load! &&
      ::RestoreOS::GitConfigSettings.new.load! &&
      ::RestoreOS::OnePasswordSettings.new.load!
  end
end
