class CreatePigeons < ActiveRecord::Migration[7.1]
  def change
    create_table :pigeons do |t|
      t.string :name
      t.integer :age
      t.string :cuteness
      t.string :softness

      t.timestamps
    end
  end
end
