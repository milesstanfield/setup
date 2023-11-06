module RestoreOS
  class VscodeSettings < ::RestoreOS::Base
    def load!
      echo_intent &&
        load_settings!
    end

    private

    def echo_intent
      warn("restoring VsCode settings.json ...")
    end

    def load_settings!
      system(
        <<~EOF.gsub(/\s+/, " ")
          cp ~/code/setup/settings/vscode/settings.json ~/.config/Code/User/settings.json
        EOF
      )
    end
  end
end
