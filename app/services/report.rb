class Report
  def initialize(params)
    @params = params
  end

  def search_teams
    if is_valid?
      @teams = Team.all
    else
      if @params[:filter] == "team"
        @teams = Team.where("name = ?", @params[:name])
      else
        @teams = search_by_teacher(@params[:name])
      end
    end 
  end

  private
  def search_by_teacher(name)
    teacher = Teacher.find_by_name(name)
    lessons = Lesson.where("teacher_id = ?", teacher.id)
    teams_ids = Set.new
    lessons.each do |lesson| teams_ids.add(lesson.team_id) end
    
    teams = Team.find(teams_ids.to_a)
  end

  def is_valid?
    @params.nil? or @params[:name].nil?
  end
end