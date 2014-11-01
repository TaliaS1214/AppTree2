class RemoveUpvoteCountFromApps < ActiveRecord::Migration
  def change
    remove_column :apps, :upvote_count
    remove_column :apps, :popularity_score
  end
end
