class AddPosterToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
    add_column :events, :end_date, :date
    add_column :events, :poster, :string
    add_column :events, :category, :string
    add_column :events, :subcategory, :string
    add_column :events, :location, :string
  end
end
