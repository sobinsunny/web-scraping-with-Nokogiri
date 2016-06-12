class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :activities


	def record_user_activity(product,url)
		#to remove empty data
		number_of_details_featched = product.select{|k,v| v1=''}.count
		user_activity = self.activities.new(:url=>url,:no_of_records_crowled=>number_of_details_featched)
		user_activity.save
	end
end
