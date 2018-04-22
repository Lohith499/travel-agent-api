class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Phone
      t.text :Address
      t.string :TravelAgent_email

      t.timestamps
    end
  end
end
