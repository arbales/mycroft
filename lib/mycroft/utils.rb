module Mycroft
  class Utils

    POSSIBLE = [('a'..'z'),('A'..'Z'),(0..9),'.','/'].inject([]) {|s,r| s+Array(r)}

    def self.shadow(password)
      salt = Array.new(8) { POSSIBLE[ rand(POSSIBLE.size) ] }
      password.crypt("$1$#{salt}")
    end
    
  end
end
  