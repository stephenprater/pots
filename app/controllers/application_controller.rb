class ApplicationController < ActionController::Base
  protect_from_forgery
  
  around_filter :pry_rescue if Rails.env.development?
 
  private 

  def pry_rescue
    Pry::rescue do
     
      yield

    end
  end
  
  def quiet_sanitizer obj, role = nil
    obj._mass_assignment_sanitizer = SilentSanitizer.new(self)
    yield obj
    obj._mass_assignment_sanitizer = :strict
    obj
  end
end
