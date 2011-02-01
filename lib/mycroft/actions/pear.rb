class Mycroft        
  module Action 
    class Pear < Base
      
      attr_accessor :package

      def initialize(action)
        @action = action
      end

      def self.install(package)
        i = self.new('install')
        i.package = package
        i.save
      end  

      def perform   
        system "pear #{@action} #{@package}"
      end 

      def log
        @action
      end

    end 
  end
end