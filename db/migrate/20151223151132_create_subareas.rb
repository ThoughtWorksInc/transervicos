class CreateSubareas < ActiveRecord::Migration
  def change
    create_table :subareas do |t|
      t.string :subarea

      t.timestamps null: false
    end
  end
end
