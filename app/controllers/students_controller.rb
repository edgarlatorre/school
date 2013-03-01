class StudentsController < ApplicationController
  respond_to :html

  def index
    @students = Student.all
    respond_with @students
  end

  def show
    @student = Student.find(params[:id])
    respond_with @student
  end

  def new
    @student = Student.new
    respond_with @student
  end

  def edit
    @student = Student.find(params[:id])
    respond_with @student
  end

  def create
    @student = Student.new(params[:student])

    if @student.save
      flash[:notice] = 'Student was successfully created.'
    end

    respond_with(@student, :location => @student)
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(params[:student])
      flash[:notice] = 'Student was successfully updated.'
    end

    respond_with(@student, :location => @student)
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_with(nil, :location => students_path)
  end
end
