class RemoveTaggingsFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :posts, :tagging, foreign_key: true
  end
end
