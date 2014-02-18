class Article < ActiveRecord::Base
	 has_attached_file :photo ,:styles => {:large => "500x300", :medium => "200x200>",:small =>"150x200>",:thumb => "50x50#"}
belongs_to :user
has_many :comments

validates :title, presence: true
validates :body, presence: true


def article_image(size)
if photo.present?
return photo.url(size)
   else
return "/assets/default_#{size}.jpg"
end
end
def user_image(size)
if photo.present?
return photo.url(size)
   else
return "/assets/User_#{size}.png"
end
end

 
end
