module RestoreOS
  class OnePasswordInstaller < ::RestoreOS::Base
    def install!
      # https://support.1password.com/install-linux/#debian-or-ubuntu
      add_key_for_1password_apt_repository! &&
        add_1password_apt_repository! &&
        add_debsig_verify_policy! &&
        install_1password!
    end

    private

    def add_key_for_1password_apt_repository!
      warn("adding 1password key to apt repository ...") &&
        system("curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg")
    end

    def add_1password_apt_repository!
      warn("adding 1password apt repository ...") &&
        system("echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list")
    end

    def add_debsig_verify_policy!
      warn("adding 1password debsig verify policy ...") &&
        system("sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
        curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
        sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
        curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg")
    end

    def install_1password!
      warn("installing 1Password ...") &&
        system("sudo apt update && sudo apt install 1password -y")
    end
  end
end
