class LessonsController < ApplicationController
  respond_to :html

  def index
    @lessons = Lesson.all
    respond_with(@lessons)
  end

  def show
    @lesson = Lesson.find(params[:id])
    respond_with(@lesson)
  end

  def new
    @lesson = Lesson.new
    respond_with(@lesson)
  end

  def create
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      flash[:notice] = t('lessons.created')
    end

    respond_with(@lesson, :location => @lesson)
  end

  def edit
    @lesson = Lesson.find(params[:id])
    respond_with @lesson
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update_attributes(params[:lesson])
      flash[:notice] = t('lessons.updated')
    end

    respond_with(@lesson, :location => @lesson)
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    respond_with(nil, :location => teams_path)
  end
end
