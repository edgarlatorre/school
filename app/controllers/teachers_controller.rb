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
      flash[:notice] = 'Teacher was successfully created.'
    end

    respond_with(@teacher, :location => @teacher)
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update_attributes(params[:teacher])
      flash[:notice] = 'Teacher was successfully updated.'
    end

    respond_with(@teacher, :location => @teacher)
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url }
      format.json { head :no_content }
    end
  end
end
