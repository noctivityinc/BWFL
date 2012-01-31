class VideosController < ApplicationController
  before_filter :get_user

  def index
    @videos = Video.public.all * 10
  end

  def show
    @video = Video.find_by_name(params[:id])
    render :layout => false 
  end


  private 

  def get_user
    @user = User.find(params[:user_id]) if params[:user_id]
    @user ||= User.find(cookies[:user_id]) if cookies[:user_id]

    redirect_to root_url, :notice => "You need to be logged in to record or watch videos" unless @user
    redirect_to user_video_path(@user) if @user && @user.videos.empty?
  end

end

