class CreateForbiddenWords < ActiveRecord::Migration
  def change
    create_table :forbidden_words do |t|
      t.string :word

      t.timestamps null: false
    end
  end
end
