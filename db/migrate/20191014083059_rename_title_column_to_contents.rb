class RenameTitleColumnToContents < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :title, :content
  end
end
