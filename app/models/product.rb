class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true

  has_attached_file :index, :styles => { medium: "250x250" }
  validates_attachment_content_type :index, :content_type => ["image/jpeg"]
end
