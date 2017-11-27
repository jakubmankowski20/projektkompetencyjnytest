class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler
  include ActionView::Layouts
end
