class LinksController < ApplicationController
  
  def index
  end

  def edit
    @link = current_user.links.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Link updated!"
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def link_params
      params.require('link').permit('title', 'url')
    end
end
