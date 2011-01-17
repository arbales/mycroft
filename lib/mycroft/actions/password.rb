class Mycroft
  module Action
    class Password < Base

      def self.change(hash)
        self.create(hash)
      end
     
      def perform
        system *%W(usermod -p #{@options['password_hash']} #{@options['user']})
      end                                                             
  
      def log
        system "#{@options['user']} changed their password."
      end                                     
    
    end
  end     
end