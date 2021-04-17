class AddCountLikeToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :count_like, :integer
    add_index :posts, :count_like
  end
end
