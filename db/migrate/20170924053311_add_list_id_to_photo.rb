class AddListIdToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :list_id, :integer
  end
end
