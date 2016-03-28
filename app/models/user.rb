class User < ActiveRecord::Base
	has_many :posts

	before_create :create_remember_token

	validates :name,presence: true, 
					length: {minimum: 6}
	validates :email,presence: true
	validates :password,presence: true, 
					length: {minimum: 6} 
									
	has_secure_password

def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

      def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end

#(name: "example", email: "example", password: "example", password_confirmation: "example")
