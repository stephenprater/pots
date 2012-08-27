class VessellsController < ApplicationController
  respond_to :html

  autocomplete :vessell, :accession_number

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
    flash[:notice] = 'Vessell Successfully Created' if @vessell.save
    respond_with @vessell
  end

  def destroy

  end

  def update

  end
end
