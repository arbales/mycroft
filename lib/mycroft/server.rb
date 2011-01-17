require 'eventmachine'

class Mycroft
  class Server < EventMachine::Connection
   
    def self.start(port=1859)
      # puts "Starting Mycroftd..."
      EventMachine::run {
        EventMachine::start_server "127.0.0.1", port, Mycroft::Server
      }
    end
    
    def receive_data(data)         
        
        begin              
          action = Marshal.load data          
        rescue
          action = {}
          Mycroft::Logbook.warn "Mycroft Failed to Process: #{data.inspect}"        
        end
        
        if action.respond_to? :perform 
          begin 
            action.perform
          rescue
            Mycroft::Logbook.warn "Perform failed on: #{action.inspect}"
          end
        end
        
        if action.respond_to? :log
          Mycroft::Logbook.info "Performing #{action.class} -- #{action.log}"                              
        else
          Mycroft::Logbook.info "Performing #{action.class}"                              
        end  
      
      close_connection if data =~ /quit|exit/i
      
      if data == "Mycroft?"
        send_data "1. Mycroftd is running."
      end
    
    end
  
  end
end