class Article < ActiveRecord::Base
	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
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
