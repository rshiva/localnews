class AddForeignKeysToTable < ActiveRecord::Migration
  def change
    add_foreign_key(:posts,:users)
    add_foreign_key(:comments,:users)
  end
end
