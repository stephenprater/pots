class SitesController < ApplicationController
  include ProvidesAssociation

  provides_association_to :vessell

  def autocomplete_site_name
    term = params[:term]
    results = Site.select(:name).select(:id).select(:name).where { (name.matches "%#{term}%") }.limit(10)
    res = results.collect do |r|
      {:id => r.id, :name => r.name}
    end
    res << {:id => 0, :name => 'New'}
    render :json => res
  end
end
