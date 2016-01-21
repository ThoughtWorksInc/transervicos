class AddNamePreferenceToUser < ActiveRecord::Migration
  def change
    add_column :users, :name_preference, :string, limit: 1
  end
end
