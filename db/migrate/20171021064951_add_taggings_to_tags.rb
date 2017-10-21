class AddTaggingsToTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :tags, :tagging, foreign_key: true
  end
end
