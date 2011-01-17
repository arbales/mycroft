class Mycroft
  module Action
    class Permissions < Base

      def perform                            
        system "chmod #{@options['chmod']} #{@options['dir']}"
        system "chown -R #{@options['chown']} #{@options['dir']}"
        @options['acl'].each{|acl|
          system "setfacl -R -m u:#{acl[0]}:#{acl[1]} #{@options['dir']}"
        }
        @options['dacl'].each{|acl|
          system "setfacl -R -m d:u:#{acl[0]}:#{acl[1]} #{@options['dir']}"
        }
      end

      def log
        @options['dir']
      end

    end
  end  
end