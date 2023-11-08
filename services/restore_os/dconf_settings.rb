module RestoreOS
  class DconfSettings < ::RestoreOS::Base
    def load!
      echo_intent &&
        load_settings!
    end

    private

    def echo_intent
      warn(
        <<~EOF
          loading system dconf which restores settings for:
            Pop!_OS: various (but not all) settings
            gnome-terminal: colors, shortcuts, etc
            IBus Preferences: fixing ctrl+shift+e VSCode shortcut (via ibus-setup GUI)
        EOF
      )
    end

    def load_settings!
      system(
        <<~EOF.gsub(/\s+/, " ")
          dconf load -f / < ~/code/setup/settings/local.dconf
        EOF
      )
    end
  end
end
