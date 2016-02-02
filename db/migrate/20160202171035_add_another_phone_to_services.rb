class AddAnotherPhoneToServices < ActiveRecord::Migration
  def change
    add_column :services, :other_phone, :string
  end
end
