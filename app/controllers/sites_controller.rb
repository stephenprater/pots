class SitesController < ApplicationController
  respond_to :js

  def autocomplete_site_name
    term = params[:term]
    results = Site.select(:name).select(:id).select(:name).where { (name.matches "%#{term}%") }.limit(10)
    res = results.collect do |r|
      {:id => r.id, :label => r.name}
    end
    res << {:id => 0, :label => 'New'}
    render :json => res
  end
 

  def new
    @site = Site.new do |s|
      s.name = params[:name]
    end
    respond_with @site
  end

  def associate
    respond_with @site 
  end
end
