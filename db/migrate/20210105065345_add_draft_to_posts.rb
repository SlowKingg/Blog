class AddDraftToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :draft, :bool, default: false
  end
end
