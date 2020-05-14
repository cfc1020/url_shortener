class LinkReportsController < ApplicationController
  def create
    @report = Reports::LinksStatistic.new

    @report.generate_report(links)

    respond_to do |format|
      format.html
      format.csv { export_as_csv }
    end
  end

  private

  def links
    @links = Link.where(id: params[:id])
  end

  def export_as_csv
    exporter = Reports::Exporters::LinkStatisticExporter.new(
      report:    @report,
      formatter: Formatters::CSVFormatter.new(header: true)
    )

    send_data exporter.export_data, filename: exporter.filename
  end
end

# Routes look like

# require 'sidekiq/web'
#
# Rails.application.routes.draw do
#   scope path: 'admin' do
#     resources :links, except: %i[edit update]
#
#     resources :clicks, only: %i[create]
#     resources :link_reports, only: %i[create]
#   end
#
#   namespace :api, defaults: { format: 'json' } do
#     namespace :v1 do
#       resources :link_reports, only: %i[create]
#     end
#   end
#
#   mount Sidekiq::Web => '/sidekiq'
#
#   match '*short_url' => 'links#click', via: [:get]
# end
