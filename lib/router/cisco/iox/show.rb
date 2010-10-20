module Interact
module Router
module Iox
module Show
  def method_missing(name, *args, &block)
    if name.to_s =~ /^show_/
      cmd = name.to_s.split('_').join(' ') + args.join(' ')
      cmd.gsub!(/running config/, 'running-config')
      p cmd
      output = __send__ :exec, cmd, *args
      #TODO block ? 
    else
      super
    end
  end
end 
end
end
end