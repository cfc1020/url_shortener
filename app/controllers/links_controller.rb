class LinksController < ApplicationController
  before_action :set_link, only: %i[show destroy]

  # Need to add a presenter for links to generate full short url path not relative

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def show
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
    end
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:url, :short_url)
  end
end
