module BackupOS
  class VscodeExtensions < ::BackupOS::Base
    def backup!
      echo_intent &&
        backup_extensions!
    end

    private

    def echo_intent
      warn("saving vscode extensions to #{path} ...")
    end

    def backup_extensions!
      system("echo \"$(code --list-extensions)\" > #{path}")
    end

    def path
      @path ||= "~/code/setup/settings/vscode/extensions.txt"
    end
  end
end
