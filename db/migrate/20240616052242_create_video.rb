class CreateVideo < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :url
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
