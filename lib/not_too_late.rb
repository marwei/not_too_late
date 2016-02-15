dir = File.join(File.dirname(__FILE__), 'not_too_late/*')
Dir[dir].each {|file| require file }
require 'date'

module NotTooLate
  class << self
    def run(time_travel, git_command)
      set_sys_time_to(Date.today - time_travel)
      puts "running #{git_command}"
      system git_command
      system "sudo ntpdate -u time.apple.com"
    end

    private

    def set_sys_time_to(date)
      command = 'sudo date $(date "+' +
                date.strftime("%m") +
                date.strftime("%d") +
                '%H%M' +
                date.strftime("%y") +
                '.%S")'
      p command
      system command
    end
  end
end