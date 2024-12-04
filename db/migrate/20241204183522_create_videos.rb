class CreateVideos < ActiveRecord::Migration[7.2]
  def change
    create_table :videos do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
