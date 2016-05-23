class DropIndexesPgTrgmOnServices < ActiveRecord::Migration
  def change
    ActiveRecord::Base.connection.execute('DROP INDEX IF EXISTS services_to_tsvector_idx;')
    ActiveRecord::Base.connection.execute('DROP INDEX IF EXISTS services_to_tsvector_idx1;')
  end
end
