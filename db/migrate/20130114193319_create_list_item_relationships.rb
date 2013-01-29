class CreateListItemRelationships < ActiveRecord::Migration
  def change
    create_table :list_item_relationships do |t|
      t.integer :list_id
      t.integer :item_id

      t.timestamps
    end

    add_index :list_item_relationships, :list_id
    add_index :list_item_relationships, :item_id
    add_index :list_item_relationships, [:list_id, :item_id], unique: true    
  end
end
