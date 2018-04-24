class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
     rename_column :vacations, :Date, :VacationDate
  end
end
