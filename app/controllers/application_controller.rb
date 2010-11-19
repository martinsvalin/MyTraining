class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_user
    @current_user ||= Person.find_by_id(session[:person_id])
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(person)
    @current_user = person
    session[:person_id] = person.id
  end
end
