class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :detail
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
