class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
    	t.integer :score
    	t.references :user
    	t.references :category
      	t.timestamps
    end
  end
end