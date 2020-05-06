class ClicksController < ApplicationController
  def create
    @click = link.click!(request_metadata)

    redirect_to @click.url
  end

  private

  def link
    @link ||= Link.find_by_short_url!(params[:short_url])
  end

  def request_metadata
    {
      referer: request.referer,
      ip_addr: request.remote_ip
    }
  end
end
