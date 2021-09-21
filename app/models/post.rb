class Post < ApplicationRecord
	validates :title, :summary, :body, presence: true
	mount_uploader :image, ImageUploader
	has_rich_text :body
end
