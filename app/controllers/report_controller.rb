class ReportController < ApplicationController
  def teams
    report = Report.new(params)
    @teams = report.search_teams
  end
end
