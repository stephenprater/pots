class CountiesController < ApplicationController
  include UpdateMultipleAction

  respond_to :html, :except => :new
  respond_to :js, :only => :new

  autocomplete :county, :name

  provides_association_to :site

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
