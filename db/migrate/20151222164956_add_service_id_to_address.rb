class AddServiceIdToAddress < ActiveRecord::Migration
  def change
  	add_column :addresses, :service_id, :integer
  end
end
