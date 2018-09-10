module ApplicationHelper

  def root_path?
    request.path == "/"
  end
end
