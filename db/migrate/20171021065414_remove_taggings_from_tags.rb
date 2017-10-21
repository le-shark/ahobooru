class RemoveTaggingsFromTags < ActiveRecord::Migration[5.1]
  def change
    remove_reference :tags, :tagging, foreign_key: true
  end
end
