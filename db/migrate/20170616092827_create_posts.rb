class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :draft, default: true
      t.datetime :published_at

      t.timestamps
    end
  end
end
