class AddRelationBetweenServiceAndSubarea < ActiveRecord::Migration
  def change
  	add_column :services, :subarea_id, :integer
  	add_column :subareas, :area_id, :integer
  end
end
