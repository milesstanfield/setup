module BackupOS
  class OnePasswordSettings < ::BackupOS::Base
    def backup!
      echo_intent &&
        backup_settings!
    end

    private

    def echo_intent
      warn("saving 1password settings to #{path} ...")
    end

    def backup_settings!
      system("cp /home/$USER/.config/1Password/settings/settings.json #{path}")
    end

    def path
      @path ||= "~/code/setup/settings/one_password/settings.json"
    end
  end
end
