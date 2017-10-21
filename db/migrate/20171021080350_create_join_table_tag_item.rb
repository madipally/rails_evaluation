class CreateJoinTableTagItem < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :items do |t|
      # t.index [:tag_id, :item_id]
      # t.index [:item_id, :tag_id]
    end
  end
end
