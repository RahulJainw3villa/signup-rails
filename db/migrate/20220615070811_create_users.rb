class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mobile
      t.string :city
      t.string :password
      t.string :confirmPassword

      t.timestamps
    end
  end
end
