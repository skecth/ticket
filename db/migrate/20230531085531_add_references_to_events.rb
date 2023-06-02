class AddReferencesToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :organizer, null: false, foreign_key: true
  end
end
