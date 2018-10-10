class AddColumnToLessons < ActiveRecord::Migration[5.2]
  def change
  	add_reference :lessons, :user, foreign_key: true
  	add_reference :lessons, :category, foreign_key: true
  end
end
