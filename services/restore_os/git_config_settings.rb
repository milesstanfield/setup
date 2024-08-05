module RestoreOS
  class GitConfigSettings < ::RestoreOS::Base
    def load!
      echo_intent &&
        load_settings!
    end

    private

    def echo_intent
      warn("restoring Git config settings ...")
    end

    def load_settings!
      system(
        <<~EOF.gsub(/\s+/, " ")
          git config --global user.name "Miles Stanfield" && \
            git config --global user.email "milesstanfield@gmail.com" && \
            git config --global core.editor "vim" && \
            git config --global merge.tool meld
            git config --global mergetool.meld.useAutoMerge true
            git config --global mergetool.meld.hideResolved true
        EOF
      )
    end
  end
end
