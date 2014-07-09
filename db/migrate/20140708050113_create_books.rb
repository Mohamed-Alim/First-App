class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :Author_name
      t.string :Library_name

      t.timestamps
    end
  end
end
