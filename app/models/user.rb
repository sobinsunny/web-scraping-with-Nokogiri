class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :activities

  def record_user_activity(product, url)
    # To remove empty data
    number_of_details_featched = product.select { |_k, _v| v1 = '' }.count
    user_activity = activities.new(url: url, no_of_records_crowled: number_of_details_featched, titile: product[:titile])
    user_activity.save
  end

  def self.from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user
      return user
    else
      registered_user = User.where(email: auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          name: auth.info.name,
          provider: auth.provider,
          email: auth.info.email,
          uid: auth.uid,
          password: Devise.friendly_token[0, 20]
        )
      end
   end
    end
end
