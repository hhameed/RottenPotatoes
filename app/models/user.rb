class User < ActiveRecord::Base
    validates_uniqueness_of :user_id
    
    def self.create_user! hash
        hash[:session_token] = SecureRandom.base64
        create!(hash)
    end
end
