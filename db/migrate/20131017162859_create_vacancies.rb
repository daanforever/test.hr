class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name
      t.date :upto
      t.integer :salary
      t.text :contacts

      t.timestamps
    end
  end
end
