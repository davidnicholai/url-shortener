class GoController < ApplicationController
  def show
    # Add security here

    url = Url.find_by shortened_text: params[:id]

    if url && url.expires_on < DateTime.now
      redirect_to url.text
    else
      redirect_to not_found
    end
  end
end
