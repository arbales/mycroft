require 'socket'

class Mycroft
  class Client

    def self.get_socket(port=1859)           
      TCPSocket.open('127.0.0.1',port)
    end
    
    def self.publish(data)
      socket = self.get_socket
      socket.print(data)
      socket.close
    end 
    
    # Borken
    
    def self.output(data)
      return false
      
      socket = self.get_socket
      socket.print(data)
      puts socket.read
      socket.close
    end
    
  end
end