class Post < ApplicationRecord
    
    belongs_to :user
    has_one_attached :image
    has_rich_text :content_ar
    has_rich_text :content_en

    validates :title_ar, presence: true
    validates :content_ar, presence: true 
    validates :image, presence: true

    def self.ransackable_attributes(auth_object = nil)
        %w(status)
        # ["image_attachment", "image_blob", "rich_text_content_ar", "rich_text_content_en", "user"]
    end
    
end
