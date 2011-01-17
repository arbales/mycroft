class Mycroft
  class ServerUtils
  
    def port_open?(port)
      begin
        Timeout::timeout(1) do
          begin
            s = TCPSocket.new("127.0.0.1", port)
            s.close
            return true
          rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
            return false
          end
        end
      rescue Timeout::Error
      end

      return false
    end 
   
  end
end