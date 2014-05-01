class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :slogan_id
      t.integer :vote
    end
  end
end
