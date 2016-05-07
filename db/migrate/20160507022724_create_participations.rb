class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :user, index: true
      t.references :team, index: true

      t.timestamps null: false
    end
  end
end
