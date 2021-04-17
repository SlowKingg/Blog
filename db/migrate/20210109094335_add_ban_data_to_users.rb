class AddBanDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ban, :datetime
  end
end
