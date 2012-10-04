class CountiesController < ApplicationController
  include UpdateMultipleAction
  include ProvidesAssociation

  respond_to :html, :except => :new
  respond_to :js, :only => :new

  autocomplete :county, :name

  associates_with :site
 
  def index
    @counties = County.all
  end

  def new
    @index = SecureRandom.uuid
    @county = County.new
  end

  def create_or_update
    @counties = super(County)
    respond_with @counties, :location => counties_path
  end
end
