class AddRelationBetweenUserAndService < ActiveRecord::Migration
  def change
    add_column :services, :user_id, :integer
  end
end
