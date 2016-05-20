class AddIndexServiceName < ActiveRecord::Migration
  def change
    execute "
      create index on services using gin(to_tsvector('portuguese', name));
    "
  end
end
