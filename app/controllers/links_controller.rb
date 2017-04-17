require 'uri'
class LinksController < ApplicationController
  
  def index
  end

  def edit
    @link = current_user.links.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])
    url = URI.parse(link_params[:url])
    if url.is_a?(URI::HTTP) && @link.update(link_params)
      flash[:success] = "Link updated!"
      redirect_to root_path
    else
      flash[:danger] = "Those updates are invalid"
      render :edit
    end
  end

  private
    def link_params
      params.require('link').permit('title', 'url')
    end
end
