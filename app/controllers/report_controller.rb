class ReportController < ApplicationController
  def teams
    @teams = Team.all
  end
end
