class AddCityAndStateToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :city_id, :integer
    add_column :addresses, :state_id, :integer
  end
end
