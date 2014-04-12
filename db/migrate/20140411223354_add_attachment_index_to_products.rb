class AddAttachmentIndexToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :index
    end
  end

  def self.down
    drop_attached_file :products, :index
  end
end
