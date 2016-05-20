class AddIndexServiceDescription < ActiveRecord::Migration
  def change
    execute "
      create index on services using gin(to_tsvector('portuguese', description));
    "
  end
end
