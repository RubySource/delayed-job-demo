class AddPageCountToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :page_count, :integer
  end
end
