require 'yaml'

module NotTooLate
  module Config
    class << self
      def read
        YAML.load_file file || {}
      end

      def write(configs)
        File.open(file, 'w') do |f|
          f.write configs.to_yaml
        end
      end

      def file
        path = `pwd`.chomp!
        until Dir.exist? File.join(path, '.git')
          path = File.expand_path('../', path)
        end
        File.join(path, '.ntl.yml')
      end

      def file_name
        '.ntl.yml'
      end

      private
        def git_dir
          "#{`pwd`.chomp!}/.git"
        end
    end
  end
end