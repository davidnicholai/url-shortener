class UrlsController < ApplicationController
  def index
    redirect_to "/urls/new"
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(params[:url].permit(:text))
    @url.shortened_text = generate_url
    @url.expires_on = 7.days.from_now

    if @url.save
      redirect_to action: "show", id: @url.shortened_text
    else
      render "new"
    end
  end

  def show
    @url = Url.find_by shortened_text: params[:id]

    @hostname = "#{request.protocol}#{request.host}:#{request.port}"

    if @url&.visited == false
      @url.visited = true
      @url.save
    else
      display_page_not_found
    end
  end

  private
    def generate_url
      short_link = ([*('A'..'Z'),*('0'..'9'),*('a'..'z')]-%w(0 1 I O)).sample(5).join

      if Url.find_by shortened_text: short_link
        return generate_url
      else
        return short_link
      end
    end
end
