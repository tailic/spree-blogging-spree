class AddMetasToBlogEntries < ActiveRecord::Migration
  def change
    add_column :spree_blog_entries, :meta_title, :string
    add_column :spree_blog_entries, :meta_description, :string
  end
end
