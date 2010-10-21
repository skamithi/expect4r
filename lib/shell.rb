require 'expect/io_interact'

class Shell
  include Interact
  def initialize()
    ENV['PROMPT_COMMAND']="date +%k:%m:%S"
    ENV['PS1']="shell>"
    @ps1 = /shell>$/
    @shell = ENV['SHELL'] || 'bash'
    login
  end
  def login
    spawn @shell
  end
end

__END__

shell = Shell.new
