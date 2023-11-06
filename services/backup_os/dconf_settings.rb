module BackupOS
  class DconfSettings < ::BackupOS::Base
    def backup!
      echo_intent &&
        backup_settings!
    end

    private

    def echo_intent
      warn("saving system dconf settings to #{path} ...")
    end

    def backup_settings!
      system("dconf dump / > #{path}")
    end

    def path
      @path ||= "~/code/setup/settings/local.dconf"
    end
  end
end
