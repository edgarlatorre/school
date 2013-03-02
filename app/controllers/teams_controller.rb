class TeamsController < ApplicationController
  respond_to :html

  def index
    @teams = Team.all
    respond_with @teams
  end

  def show
    @team = Team.find(params[:id])
    respond_with @team
  end

  def new
    @team = Team.new
    respond_with @team
  end

  def edit
    @team = Team.find(params[:id])
    respond_with @team
  end

  def create
    @team = Team.new(params[:team])

    if @team.save
      flash[:notice] = 'Team was successfully created.'
    end

    respond_with(@team, :location => @team)
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(params[:team])
      flash[:notice] = 'Team was successfully updated.'
    end

    respond_with(@team, :location => @team)
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    respond_with(nil, :location => teams_path)
  end
end
