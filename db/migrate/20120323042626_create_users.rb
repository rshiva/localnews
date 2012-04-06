class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :email => true , :not_blank => true
      t.string :password_digest
      t.string :display_name ,:unique => true , :not_blank => true

      t.timestamps
    end
  end
end
