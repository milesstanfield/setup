module RestoreOS
  class OnePasswordSettings < ::RestoreOS::Base
    def load!
      echo_intent &&
        load_settings!
    end

    private

    def echo_intent
      warn("restoring 1Password settings.json ...")
    end

    def load_settings!
      system(
        <<~EOF.gsub(/\s+/, " ")
          cp #{path} /home/$USER/snap/1password/132/.config/1Password/settings/settings.json
        EOF
      )
    end

    def path
      @path ||= "~/code/setup/settings/one_password/settings.json"
    end
  end
end
