class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :photo ,:styles => {:large => "500x300", :medium => "200x200>",:small =>"150x200>",:thumb => "50x50#"} 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


         has_many :articles
         has_many :comments
        



 def user_image(size)
if photo.present?
return photo.url(size)
   else
return "/assets/User_#{size}.png"
end
end
               
end
