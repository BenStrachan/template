class AddTimezoneToBusiness < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :time_zone, :string
  end
end
