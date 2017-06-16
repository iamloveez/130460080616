class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.integer :student
      t.integer :score

      t.timestamps
    end
  end
end
