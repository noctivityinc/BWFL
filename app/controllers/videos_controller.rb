class VideosController < ApplicationController
  before_filter :get_user

  def index
    @videos = (params[:all] == '1') ? Video.page(params[:page]) : Video.not_private.page(params[:page])
   
    respond_to do |wants|
      wants.html { 
        if request.xhr?
          render :partial => 'video', :locals => {:videos => @videos}
        end
      }
    end

  end

  def show
    @video = Video.find_by_name(params[:id])
    render :layout => false 
  end


  private 

  def get_user
    @user = User.find(params[:user_id]) if params[:user_id]
    @user ||= User.find(cookies[:user_id]) unless cookies[:user_id].blank?

    redirect_to root_url, :notice => "You need to be logged in to record or watch videos" unless @user
    redirect_to new_user_video_path(@user) if @user && !@user.recorded_video
  end

end

