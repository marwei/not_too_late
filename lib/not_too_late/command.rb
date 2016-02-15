module NotTooLate
  module Command
    class << self
      def init_config
        puts "initiaize config file"
        Config.write({'time_travel' => 0})
      end

      def get_time_travel
        config = Config.read
        config['time_travel']
      end

      def set_time_travel(new_time)
        config = Config.read

        if new_time > config['time_travel']
          puts "You are traveling back in time again, "\
               "this might cause unexpected results to your git history. "\
               "Are you sure? (Press 'Y' to proceed, or any other key to abort"
          return unless STDIN.gets.chomp! == 'Y'
        end
        config['time_travel'] = new_time
        Config.write config
      end
    end
  end
end