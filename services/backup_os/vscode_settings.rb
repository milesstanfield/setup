module BackupOS
  class VscodeSettings < ::BackupOS::Base
    def backup!
      echo_intent &&
        backup_settings!
    end

    private

    def echo_intent
      warn("saving vscode settings to #{path} ...")
    end

    def backup_settings!
      system("cp ~/.config/Code/User/settings.json #{path}")
    end

    def path
      @path ||= "~/code/setup/settings/vscode/settings.json"
    end
  end
end
