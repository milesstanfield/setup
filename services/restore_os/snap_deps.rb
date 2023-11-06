module RestoreOS
  class SnapDeps < ::RestoreOS::Base
    def install!
      echo_intent &&
        install_deps!
    end

    private

    def echo_intent
      warn(
        <<~EOF
        installing bespoke snap applications ---
          1password: password manager
        EOF
      )
    end

    def install_deps!
      system(
        <<~EOF.gsub(/\s+/, " ")
          sudo snap install -y \
            1password
        EOF
      )
    end
  end
end
