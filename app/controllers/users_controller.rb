class UsersController < ApplicationController
  skip_before_filter :current_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user.videos.empty?
      render :no_videos
    else
      redirect_to user_video_path(@user, @user.videos.first)
    end
  end

  def new
    if cookies[:user_id]    
      @user = User.find(cookies[:user_id])
      redirect_to @user if @user
    end
    
    @user = User.new
  end

  def create
    @user = User.find_or_initialize_by_email(params[:user])
    if !@user.new_record?
      redirect_to @user
    else
      if @user.save
        session[:user_id] = @user.id
        cookies[:user_id] = @user.id
        redirect_to @user
      else
        render :action => 'new'
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to videos_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :notice => "Successfully destroyed user."
  end
end
