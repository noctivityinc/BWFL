class Users::VideosController < ApplicationController

  before_filter :get_user

  def new

  end

  # framey callback
  def callback
    render :text => "" and return unless request.post? && params[:video]


    video = Video.create!({
      :name => params[:video][:name],
      :filesize => params[:video][:filesize],
      :duration => params[:video][:duration],
      :state => params[:video][:state],
      :views => params[:video][:views],
      :flv_url => params[:video][:flv_url],
      :mp4_url => params[:video][:mp4_url],
      :small_thumbnail_url => params[:video][:small_thumbnail_url],
      :medium_thumbnail_url => params[:video][:medium_thumbnail_url],
      :large_thumbnail_url => params[:video][:large_thumbnail_url]
    })

    render :text => "" and return
  end

  def index
    @videos = Video.all
  end

  def show
    @video = @user.video.find_by_name(params[:id])
  end


  private 

  def get_user
    @user = User.find(params[:user_id]) if params[:user_id]
    @user ||= User.find(cookies[:user_id]) if cookies[:user_id]

    redirect_to root_url, :notice => "You need to be logged in to record or watch videos" unless @user
  end

end

