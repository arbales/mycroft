require 'fileutils'   

class Mycroft        
  module Action 
    class Base
                     
     def initialize(*options)
       unless options
         raise ArgumentError, "A method name or a hash is required."
       end
        case options[0]
          when Symbol
            @action = options[0]
            @options = options[1..-1]
          when Hash
            @options = options[0]
          else
            raise ArgumentError, "A method name or a hash is required."
        end
      end
         
      # Commits to mycroft, required.
      def save()  
        Mycroft::Client.publish(Marshal.dump(self))
      end
                                     
      def self.create(options)
        i = self.new(options)
        i.save
      end                            
            
      def self.restart
        self.new(:restart).save
      end

      def perform   
        if @action
          self.call @action                   
        end
      end 

      def log
        (@action ? @action : @options)
      end

    end 
  end
end