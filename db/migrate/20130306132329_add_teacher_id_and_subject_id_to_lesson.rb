class AddTeacherIdAndSubjectIdToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :teacher_id, :integer
    add_column :lessons, :subject_id, :integer
  end
end
