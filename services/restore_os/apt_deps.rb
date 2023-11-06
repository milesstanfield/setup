require "/home/milesstanfield/code/setup/services/restore_os/base.rb"

module RestoreOS
  class AptDeps < ::RestoreOS::Base
    def install!
      echo_intent &&
        install_deps!
    end

    private

    def echo_intent
      warn(
        <<~EOF
          installing utility dependencies ---
            dbus-x11: for using sudo dconf load in load_settings alias
            vim: for working in git and editing commit messages
            libimobiledevice-utils: gives idevicepair cli to pair/access mounted iphones
            ifuse: allows to mount iPhone and access its file system in linux
            dconf-editor: is a GUI for dconf (settings)
            flatpak: package manager
        EOF
      )
    end

    def install_deps!
      system(
        <<~EOF.gsub(/\s+/, " ")
          sudo apt-get install -y \
            dbus-x11 \
            vim \
            libimobiledevice-utils \
            ifuse \
            dconf-editor \
            flatpak
        EOF
      )
    end
  end
end
