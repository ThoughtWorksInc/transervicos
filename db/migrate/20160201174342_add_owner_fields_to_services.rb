class AddOwnerFieldsToServices < ActiveRecord::Migration
  def change
    add_column :services, :owner_name, :string
    add_column :services, :owner_email, :string
  end
end
