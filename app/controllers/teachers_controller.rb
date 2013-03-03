class TeachersController < ApplicationController
  respond_to :html

  def index
    @teachers = Teacher.all
    respond_with @teachers
  end

  def show
    @teacher = Teacher.find(params[:id])
    respond_with @teacher
  end

  def new
    @teacher = Teacher.new
    respond_with @teacher
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def create
    @teacher = Teacher.new(params[:teacher])

    if @teacher.save
      flash[:notice] = t("teachers.created")
    end

    respond_with(@teacher, :location => @teacher)
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update_attributes(params[:teacher])
      flash[:notice] = t("teachers.updated")
    end

    respond_with(@teacher, :location => @teacher)
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_with(nil, :location => teachers_path)
  end
end
