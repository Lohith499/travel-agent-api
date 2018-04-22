class AddCustomerToVacation < ActiveRecord::Migration[5.1]
  def change
    add_reference :vacations, :Customer, foreign_key: true
  end
end
