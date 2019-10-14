class RenameContentsToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_table :contents, :posts
  end
end
