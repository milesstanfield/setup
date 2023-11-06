module RestoreOS
  class FlatpakDeps < ::RestoreOS::Base
    def install!
      warn("adding remote to flathub.org for flatpak repos ...") &&
        system("sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo") &&
        echo_intent &&
        install_deps!
    end

    private

    def echo_intent
      warn(
        <<~EOF
          installing bespoke flatpak applications ---
            vscode: code editor
            discord: social messaging app
            sticky notes: just what it sounds like
            chrome: internet browser
            flameshot: quick markup editor (like skitch)
            gimp: image editor (like photoshop)
            signal: secure messaging app
        EOF
      )
    end

    def install_deps!
      system(
        <<~EOF.gsub(/\s+/, " ")
          sudo flatpak install flathub -y \
            com.visualstudio.code \
            com.discordapp.Discord \
            com.vixalien.sticky \
            com.google.Chrome \
            org.flameshot.Flameshot \
            org.gimp.GIMP \
            org.signal.Signal
        EOF
      )
    end
  end
end
