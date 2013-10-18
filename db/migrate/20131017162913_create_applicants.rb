class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.text :contacts
      t.boolean :status
      t.integer :salary

      t.timestamps
    end
  end
end
