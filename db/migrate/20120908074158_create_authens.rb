class CreateAuthens < ActiveRecord::Migration
  def change
    create_table :authens do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
