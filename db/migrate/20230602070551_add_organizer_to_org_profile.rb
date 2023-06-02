class AddOrganizerToOrgProfile < ActiveRecord::Migration[7.0]
  def change
    add_reference :org_profiles, :organizer, null: false, foreign_key: true
  end
end
