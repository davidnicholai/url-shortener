class GoController < ApplicationController
  def show
    start_time = Time.now

    url = Url.find_by shortened_text: params[:id]

    end_time = Time.now

    if url && url.expires_on > DateTime.now
      @elapsed_time = "Retrieval took #{end_time - start_time} seconds"
      @link = url.text
    else
      display_page_not_found
    end
  end
end
