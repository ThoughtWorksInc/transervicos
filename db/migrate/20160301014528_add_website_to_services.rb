class AddWebsiteToServices < ActiveRecord::Migration
  def change
    add_column :services, :website, :string
  end
end
