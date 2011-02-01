class Mycroft        
  module Action 
    class Touch < Base
      
      def initialize(path)
        @path = path
      end

      def perform   
        sleep 4                    
        system *%W(touch #{@path})
      end 

      def log
        @action
      end

    end 
  end
end