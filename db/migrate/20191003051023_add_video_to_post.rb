class AddVideoToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :video, :string
  end
end
