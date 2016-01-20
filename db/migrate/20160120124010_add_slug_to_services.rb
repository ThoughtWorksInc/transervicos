class AddSlugToServices < ActiveRecord::Migration
  def change
    add_column :services, :slug, :string
    add_index :services, :slug, unique: true
  end
end
