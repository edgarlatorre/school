class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :teacher_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
