class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, except: [:show, :new, :create, :optin, :change_optin, :friendlist]
  before_action :check_owner, only: [:show]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @bang = Array.new
    @banged = Array.new
    
    @user.friendships.each do |f|
      @bang.push(f.friend.id)
    end

    @user.inverse_friends.each do |f|
      @banged.push(f.id)
    end
    @matches = (@bang & @banged)

  end

  def friendlist
    @users = User.where(:optin => true).where("id != ?", current_user.id)
  end
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def optin
    @user = current_user
  end

  def change_optin
    if params[:optin] == 'true'
      current_user.update_attribute(:optin, true)
      flash[:notice] = 'You successfully opted in!'
    else
      current_user.update_attribute(:optin, false)
      flash[:notice] = 'You opted out'
    end      

      redirect_to root_path
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :avatar)
    end
end
