class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.float :price
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
