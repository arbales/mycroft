
class Mycroft
         
  autoload :Utils,          'mycroft/utils'   
  autoload :Server,         'mycroft/server'
  autoload :Logbook,         'mycroft/logbook'
  autoload :Client,         'mycroft/client'
    
  module Action
    autoload :Base,             'mycroft/actions/base'
    autoload :Password,         'mycroft/actions/password'
    autoload :CreateSite,       'mycroft/actions/create_site'
    autoload :Nginx,            'mycroft/actions/nginx'
    autoload :Permissions,      'mycroft/actions/permissions'
    autoload :FlushPermissions, 'mycroft/actions/flush_permissions'
  end  
  
  class Error < StandardError
  end
  
  def self.setup(port)
    @@server_port = path
    unless Mycroft::ServerUtils.port_open? @@server_port
      raise Mycroft::Error, "Mycroft is not available on port #{@@server_port}"
    end   
    true
  end
  
  def self.server_port()
    unless defined? @@server_port
      raise Mycroft::Error, "No server port specified. Please run Mycroft.setup(port)."
    end
    @@server_port
  end
  
end