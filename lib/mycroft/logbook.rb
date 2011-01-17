require 'logger'              

class Mycroft
  class Logbook
              
    def self.setup(path='./logs/mycroft.log', period='monthly')
      @@path = path
      @@logger = Logger.new(path, period)
    end            
    
    def self.path
      @@path ||= "./logs/mycroft.log"
    end
    
    def self.logger
      @@logger ||= self.setup
      @@logger
    end
    
    def self.warn(string)
      self.logger().warn string           
    end                      
    
    def self.info(string)
      self.logger().info string           
    end
    
  end
end