class CreateCitizens < ActiveRecord::Migration[8.0]
  def change
    create_table :citizens do |t|
      t.string :name
      t.string :rut
      t.string :address
      t.string :location

      t.timestamps
    end
  end
end
