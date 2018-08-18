require 'jwt'
class JsonWebToken
    def self.encode(payload)
        payload = payload.dup
        payload['exp'] = 24.hours.from_now.to_i     
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end   
    
def self.decode(token)
    
    salida=JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    
    
    HashWithIndifferentAccess.new (salida)

end

end;