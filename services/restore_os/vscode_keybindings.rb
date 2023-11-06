module RestoreOS
  class VscodeKeybindings < ::RestoreOS::Base
    def load!
      echo_intent &&
        load_keybindings!
    end

    private

    def echo_intent
      warn("restoring VsCode keybindings.json ...")
    end

    def load_keybindings!
      system(
        <<~EOF.gsub(/\s+/, " ")
          cp ~/code/setup/settings/vscode/keybindings.json ~/.config/Code/User/keybindings.json
        EOF
      )
    end
  end
end
