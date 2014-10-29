class CreateAppsGenresJoinTable < ActiveRecord::Migration
  def change
    create_join_table :apps, :genres
  end
end
