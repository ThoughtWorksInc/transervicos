class DropExtensionPgTrgm < ActiveRecord::Migration
  def change
    ActiveRecord::Base.connection.execute('DROP EXTENSION IF EXISTS pg_trgm;')
  end
end
