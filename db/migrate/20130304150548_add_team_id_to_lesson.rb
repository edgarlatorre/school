class AddTeamIdToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :team_id, :integer
  end
end
