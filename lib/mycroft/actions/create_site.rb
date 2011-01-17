class Mycroft
  module Action
    class CreateSite < Base
    
      def perform
        system "mkdir -p /home/#{@options['user']}/#{@options['site']}"
      end
    
    end          
  end
end