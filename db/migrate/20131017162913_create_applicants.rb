class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.text :contacts
      t.string :status
      t.integer :salary

      t.timestamps
    end
  end
end
