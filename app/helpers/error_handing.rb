### Place helper methods (functionality that is shared between controllers and views) in this folder -- for example:

#app/helpers/formatting.rb

helpers do

  def error_show_page?
    request.path_info == "/events/create"
  end

end

