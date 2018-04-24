class CreateVacations < ActiveRecord::Migration[5.1]
  def change
    create_table :vacations do |t|
      t.string :Place
      t.string :VacationDate
      t.string :Description
      t.integer :Budget
      t.integer :Transport,default: 2
      t.string :Image
      t.timestamps
    end
  end
end
