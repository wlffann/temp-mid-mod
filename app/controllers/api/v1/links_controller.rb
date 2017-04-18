require 'uri'

class Api::V1::LinksController < ApplicationController
  
  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      if link_params[:read] = 'true'
        HotReadsService.new(link_params[:url]).send_read
        render json: @link
      else
        render json: @link
      end
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def create
    user = User.find(params[:link][:user_id])
    link = user.links.new(link_params)
    if link.save
      response = HotReadsService.new.top_reads
      top_reads = JSON.parse(response.body).map {|k,v| v}
      render partial: '/links/link', locals: {link: link, top_reads: top_reads}, layout: false
    else
      render status: 400, json: {"errors": link.errors.full_messages}
    end
  end
  
  private

  def link_params
    params.require('link').permit(:read, :user_id, :url, :title)
  end
end
