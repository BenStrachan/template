class AddBusinessIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :business_id, :integer, index: true
  end
end
