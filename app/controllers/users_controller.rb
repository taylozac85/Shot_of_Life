class UsersController < ApplicationController
  before_filter :signed_in_user, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user,   :only => [:edit, :update]
  before_filter :admin_user,     :only => :destroy

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.paginate(:page => params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    # no need to assign @user because that is done with :correct_user in the before_filter
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      # so that when a user signs up they are automatically signed in
      sign_in @user
      # flash is a hash- the expression below sets key ':success' to value 'Welcome...'
      # in layouts/application.html.erb flash.each do |key,value| uses this key,value pair as arguements
      flash[:success] = "Welcome to Shot of Life!"
      redirect_to @user
    else
      render "new" 
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    # no need to assign @user because that is done with :correct_user in the before_filter

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = 'User was successfully updated.'
        # flash is a hash- the expression below sets key ':success' to value 'Welcome...'
        # in layouts/application.html.erb flash.each do |key,value| uses this key,value pair as arguements
        sign_in @user
        format.html { redirect_to @user }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
