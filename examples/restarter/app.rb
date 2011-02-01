# Here's a pseudocode example.

require 'grape'
require 'mycroft'
              
class Neato::API < Grape::API
  version '1'
                                                    
  get '/nginx/restart' do
    Mycroft::Action::Nginx.restart()
    "Nginx will restart in a few moments."
  end

  resource :sites do                                

    post '/restart/:id' do        
      site = Site.get params[:id]   

      if site.is_mod_rack?
        Mycroft::Action::Touch.create "#{site.path}/tmp/restart.txt"
        "The mod_rack application, #{site.name}, will be restarted."
      else 
        error "The site, #{site.name}, does not run with mod_rack."
      end
    end      

  end   
  
  resource :users do 
    
    post :password do
      authenticate!
      Mycroft::Action::Password.change({user: current_user.username,
                                        password_hash: params[:password].to_shadow})
    end

  end

end