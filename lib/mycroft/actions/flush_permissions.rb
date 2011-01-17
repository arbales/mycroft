class Mycroft
  module Action
    class FlushPermissions < Base

      def perform
        system "setfacl -R -d #{@options}"
      end                            
  
      def log
        @options
      end

    end                            
  end
end