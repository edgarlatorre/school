class SubjectsController < ApplicationController
  respond_to :html

  def index
    @subjects = Subject.all
    respond_with @subjects
  end

  def show
    @subject = Subject.find(params[:id])
    respond_with @subject
  end

  def new
    @subject = Subject.new
    respond_with @subject
  end

  def edit
    @subject = Subject.find(params[:id])
    respond_with @subject
  end

  def create
    @subject = Subject.new(params[:subject])

    if @subject.save
      flash[:notice] = t("subjects.created")
    end
    respond_with(@subject, :location => @subject)
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(params[:subject])
      flash[:notice] = t("subjects.updated")
    end
    respond_with(@subject, :location => @subject)
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_with(nil, :location => subjects_path)
  end
end
