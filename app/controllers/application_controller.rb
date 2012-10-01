class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private 
  
  def quiet_sanitizer obj, role = nil
    obj._mass_assignment_sanitizer = SilentSanitizer.new(self)
    yield obj
    obj._mass_assignment_sanitizer = :strict
    obj
  end
end
