module Api
  module V1
    class LinkReportsController < Api::BaseController
      def create
        @report = Reports::LinksStatistic.new

        @report.generate_report(links)

        respond_resource(@report, status: :created)
      end
    end
  end
end
