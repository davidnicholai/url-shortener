class UrlsController < ApplicationController
  def index
    redirect_to "/urls/new"
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.slug = Url.generate_url

    new_url = "#{request.protocol}#{request.host_with_port}/#{@url.slug}"

    if @url.save
      # Flashes the new_url to the user.
      redirect_to "/urls/new", notice: new_url
    else
      # Display the same page, but this time it'll carry errors.
      render "new", status: 400
    end
  end

  def show
    url = Url.find_by slug: params[:id]

    if url && url.created_at + 7.days > DateTime.now
      redirect_to url.original_url
    else
      display_page_not_found
    end
  end

  private
    def url_params
      params[:url].permit(:original_url)
    end
end
