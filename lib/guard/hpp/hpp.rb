require 'guard/guard'
require 'guard/watcher'
 
module ::Guard
  class Hpp< ::Guard::Guard
    def run_all
      invoke_processing
    end
 
    def run_on_changes(paths)
      invoke_processing
    end
     
    def start
      invoke_processing
    end
 
    def stop
    end
     
    def invoke_processing
      puts 'changed'
    end
     
  end
end