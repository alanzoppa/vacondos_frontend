class SearchController < ApplicationController
  def index 
    respond_to do |format|
      format.html
      format.json {
        render json: search(params.permit(:zip))
      }
    end
  end

  def search(params)
    uri = URI.join(
      "http://vacondos_core.dev",
      "homes.json?#{params.to_h.to_query}"
    )
    output = JSON.parse(open(uri).read)
    return output
  end
end
