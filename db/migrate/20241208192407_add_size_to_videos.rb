class AddSizeToVideos < ActiveRecord::Migration[7.2]
  def change
    add_column :videos, :size, :integer
  end
end
