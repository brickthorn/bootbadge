class UpdateUsers < ActiveRecord::Migration
  def change
     remove_column :users, :cohort
  end
end
