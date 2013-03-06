class LessonsController < ApplicationController
  respond_to :json
  def create
    @lesson = Lesson.new(params[:lesson])
    @lesson.save
    respond_with @lesson
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    respond_with(nil, :location => teams_path)
  end
end
