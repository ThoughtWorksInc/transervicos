class AddCityAndStateToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :city_id, :integer
    add_column :addresses, :state_id, :integer
    remove_column :addresses, :city
    remove_column :addresses, :state
  end
end
