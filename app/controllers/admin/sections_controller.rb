class Admin::SectionsController < ApplicationController
  before_filter :admin_required


  def index
    @sections=Section.find(:all, :order => "created_at DESC")
  end

  def new
    @section=Section.new
  end

  def create
    @section=Section.new(params[:section])

    if  @section.save!
      flash[:notice]="Раздел создан."
      redirect_to admin_sections_path
    else
      render :action => "new"
    end
  end

  def edit
    @section=Section.find(params[:id])
  end

  def update
    @section=Section.find(params[:id])

    if  @section.update_attributes(params[:section])
      flash[:notice]="Раздел обновлен"
      redirect_to admin_sections_path
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    respond_to do |format|
      format.html { redirect_to(admin_sections_url) }
      format.xml  { head :ok }
    end
  end
  
  

end
