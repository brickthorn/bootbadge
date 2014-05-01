class CreateSlogans < ActiveRecord::Migration
  def change
    create_table :slogans do |t|
      t.string :content
      t.timestamps
    end
  end
end
