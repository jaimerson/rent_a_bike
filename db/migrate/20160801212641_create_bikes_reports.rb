class CreateBikesReports < ActiveRecord::Migration
  def change
    create_view :bikes_reports, materialized: true
  end
end
