class VessellsController < ApplicationController
  respond_to :html

  autocomplete :vessell, :accession_number

  def autocomplete_lookup_attributes kind, term
    results = LookupAttribute.select(:value).select(:id).where {
      (value.matches "%#{term}%") && (type == kind.classify )
    }.limit(10)
    results.collect do |r|
      {:id => r.id, :label => r.value}
    end
  end

  def autocomplete_collection
    render :json => (autocomplete_lookup_attributes "collections", params[:term])
  end

  def autocomplete_analyst
    render :json => (autocomplete_lookup_attributes "analysts", params[:term])
  end

  def autocomplete_project_name
    render :json => (autocomplete_lookup_attributes "project_names", params[:term])
  end
  
  def autocomplete_cultural_affliation
    render :json => (autocomplete_lookup_attributes "cultural_affliations", params[:term])
  end


  def index
    @vessells = Vessell.paginate(:page => params[:page], :per_page => 20)
    respond_with(@vessells)
  end

  def new
    @vessell = Vessell.new
    respond_with(@vessell)
  end

  def edit
    
  end

  def show

  end

  def create
    @vessell = Vessell.new(params[:product])
    @vessell.save
    respond_with @vessell
  end

  def destroy

  end

  def update

  end
end
