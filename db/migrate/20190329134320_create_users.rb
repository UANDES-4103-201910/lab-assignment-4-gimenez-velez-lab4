class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :password
      t.string :address
<<<<<<< HEAD
	t.integer :phone
=======
			t.integer :phone
>>>>>>> 8efe46a66af3be9e600604afb9da9881c1257059

      t.timestamps
    end
  end
end
