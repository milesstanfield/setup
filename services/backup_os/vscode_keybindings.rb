module BackupOS
  class VscodeKeybindings < ::BackupOS::Base
    def backup!
      echo_intent &&
        backup_keybindings!
    end

    private

    def echo_intent
      warn("saving vscode keybindings to #{path} ...")
    end

    def backup_keybindings!
      system("cp ~/.config/Code/User/keybindings.json #{path}")
    end

    def path
      @path ||= "~/code/setup/settings/vscode/keybindings.json"
    end
  end
end
