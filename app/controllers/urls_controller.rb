class UrlsController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]

  def create
    @url = Url.new(url_params)
    @url.slug = Url.generate_url

    if logged_in?
      @url.user_id = session[:user_id]
    end

    new_url = "#{request.protocol}#{request.host_with_port}/#{@url.slug}"

    if @url.save
      # Flashes the new_url to the user.
      redirect_to '/', notice: new_url
    else
      # Display the same page, but this time it'll carry errors.
      redirect_to 'sessions/welcome', status: 400
    end
  end

  def show
    url = Url.find_by slug: params[:id]

    if url&.active && url.created_at + 7.days > DateTime.now
      statistic = Statistic.new
      statistic.url_id = url.id
      # Sanitized at model-level
      statistic.referer = request.referer
      statistic.ip_address = request.remote_ip
      statistic.save

      # For some reason the show controller is visited twice (hence two counts).
      # Will look into it at a later time.
      redirect_to url.original_url
    else
      display_page_not_found
    end
  end

  # Disables a link
  def update
    @url = Url.find(params[:id])

    if @url&.user_id == session[:user_id]
      @url.active = !@url.active
      @url.save
    end

    redirect_to '/'
  end

  # Permanently deletes a link
  def destroy
    @url = Url.find(params[:id])

    if @url&.user_id == session[:user_id]
      @url.destroy
    end

    redirect_to '/'
  end

  private
    def url_params
      params[:url].permit(:original_url)
    end
end
