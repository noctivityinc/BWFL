class UsersController < ApplicationController
  skip_before_filter :current_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) rescue nil
    if @user
      if @user.videos.empty?
        render :no_videos
      else
        cookies[:user_id] = @user.id
        redirect_to user_video_path(@user, @user.videos.first)
      end
    else
      redirect_to root_url
    end
  end

  def new
    unless cookies[:user_id].blank?
      @user = User.find_by_id(cookies[:user_id])
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
        cookies[:user_id] = @user.id
        UserMailer.welcome(@user).deliver
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

  def logout
    cookies[:user_id] = nil
    redirect_to root_url
  end

  def invite
    @user = User.find(params[:id]) rescue nil
    emails = params[:emails].split(',')

    emails.each do |email|
      unless User.find_by_email(email)
        UserMailer.invite(@user, email).deliver
        @user.increment(:invites_sent)
      end
    end
    @user.save

    respond_to do |format|
      format.html {}
      format.json {
        render :json => @user
      }
    end
  end


end
