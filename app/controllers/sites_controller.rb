class SitesController < ApplicationController
  respond_to :js

  autocomplete :site, :name

  def new
    render
  end
end
