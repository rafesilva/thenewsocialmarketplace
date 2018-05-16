class Product < ApplicationRecord
    
    mount_uploader :image_file, ImageFileUploader
    
    has_many :line_items, dependent: :delete_all
    
    belongs_to :user, foreign_key: :user_id

    validates :user_id, presence: true 

    validates :title, :description, presence: true
    validates :title, uniqueness: true
    validates :image_url, format: { with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.', :allow_nil => true, :allow_blank => true}
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }

    private
             # ensure that there are no line items referencing this product
        def ensure_not_referenced_by_any_line_item 
            unless line_items.empty?
                errors.add(:base, 'Line Items present')
            throw :abort 
        end
       
    end

end