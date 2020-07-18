class UrlsController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]

  def create
    original_url = params[:url][:original_url]
    original_url = normalize_url(original_url)
    @url = Url.new(original_url: original_url)
    @url.slug = Url.generate_url

    if logged_in?
      @url.user_id = current_user.id
    end

    if @url.save
      new_url = "#{request.protocol}#{request.host_with_port}/#{@url.slug}"

      # Flashes the new_url to the user.
      redirect_to '/', notice: new_url
    else
      # Display the same page, but this time it'll carry errors.
      redirect_to '/', alert: @url.errors.full_messages
    end
  end

  def show
    url = Url.find_by slug: params[:id]

    if url&.active && url.created_at + 7.days > DateTime.now
      statistic = Statistic.create(url_id: url.id, referer: request.referer, ip_address: request.remote_ip)
      redirect_to url.original_url
    else
      display_page_not_found
    end
  end

  # Disables a link
  def update
    @url = Url.find_by id: params[:id]

    if @url&.user_id == session[:user_id]
      @url.active = !@url.active
      @url.save
    end

    redirect_to '/'
  end

  # Permanently deletes a link
  def destroy
    @url = Url.find_by id: params[:id]

    if @url&.user_id == session[:user_id]
      @url.destroy
    end

    redirect_to '/'
  end

  private
    def url_params
      params[:url].permit(:original_url)
    end

    def normalize_url(original_url)
      if original_url.starts_with?('http://') || original_url.starts_with?('https://')
        original_url
      else
        "https://#{original_url}"
      end

    end
end
