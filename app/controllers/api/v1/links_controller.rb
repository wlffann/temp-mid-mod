require 'uri'

class Api::V1::LinksController < ApplicationController
  
  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def create
    user = User.find(params[:link][:user_id])
    link = user.links.new(link_params)
    if link.save
      render partial: '/links/link', locals: {link: link}, layout: false
    else
      render status: 400, json: {"errors": link.errors.full_messages}
    end
  end
  
  private

  def link_params
    params.require('link').permit(:read, :user_id, :url, :title)
  end
end
