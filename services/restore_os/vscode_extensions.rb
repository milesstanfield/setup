require "open3"

module RestoreOS
  class VscodeExtensions < ::RestoreOS::Base
    def install!
      echo_intent &&
        install_extensions!
    end

    private

    def echo_intent
      warn(
        <<~EOF
          installing VsCode extensions ---
            #{extensions.join("\n  ")}
        EOF
      )
    end

    def install_extensions!
      extensions.map do |ext|
        stdout, stdeerr, status = Open3.capture3("code --install-extension #{ext}")
        if status.success?
          success(stdout)
        else
          error(stdeerr)
          break
        end
      end
    end

    def extensions # ["bung87.rails", "bung87.vscode-gemfile"]
      return @extensions if defined?(@extensions)
      file_path = "/home/milesstanfield/code/setup/settings/vscode/extensions.txt"
      @extensions = File.readlines(file_path, chomp: true).to_a
    end
  end
end