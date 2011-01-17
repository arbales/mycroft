class Mycroft        
  module Action 
    class Nginx < Base

      def initialize(action)
        @action = action
      end

      def self.create(action)
        i = self.new(action)
        i.save
      end
      
      def self.restart
        i = self.new "restart"
        i.save        
      end
      
      def self.restart
        i = self.new "reload"
        i.save        
      end     

      def perform   
        sleep 4                    
        system "/etc/init.d/nginx #{@action}"
      end 

      def log
        @action
      end

    end 
  end
end