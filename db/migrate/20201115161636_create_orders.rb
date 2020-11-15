class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :quantity

      t.timestamps
    end

    add_index :orders, %i[product user]
  end
end
