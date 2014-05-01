class AddUserIdToSlogans < ActiveRecord::Migration
  def change
    add_column :slogans, :user_id, :integer
  end
end
