class RemoveTeacherIdSubjectIdFromLesson < ActiveRecord::Migration
  def up
    remove_column :lessons, :teacher_id
    remove_column :lessons, :subject_id
  end

  def down
    add_column :lessons, :teacher_id
    add_column :lessons, :subject_id
  end
end
