class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :suggests, dependent: :destroy
 attr_accessor :remember_token

   class << self
     def digest string
       cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
         BCrypt::Engine.cost
       BCrypt::Password.create string, cost: cost
     end

     def new_token
       SecureRandom.urlsafe_base64
     end
   end

   def remember
     self.remember_token = User.new_token
     update_attributes remember_digest: User.digest(remember_token)
   end

   def authenticated?(remember_token)
     BCrypt::Password.new(remember_digest).is_password?(remember_token)
   end

   def forget
     update_attributes remember_digest: nil
   end

   private
   def downcase_email
     self.email = email.downcase
   end
end
