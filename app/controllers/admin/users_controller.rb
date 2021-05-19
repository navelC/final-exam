class Admin::UsersController < Admin::BaseController

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
     @user = User.find(params[:id])
     @posts = Post.where(user_id: params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      @user[:role] = 'visitor'
      @user[:coin] = '0'
      if @user.save
        format.html { redirect_to root_path}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  def login
    if user = User.find_by(account:params[:account])
      if  user && user.authenticate(params[:password])
        # Save the user ID in the session so it can be used in
        session[:user_id] = user.id
        redirect_to root_path 
      else  flash.now[:danger] = 'sai tên đăng nhập hoặc mật khẩu!'
      end
    else
      if params[:account]
        flash.now[:danger] = 'sai tên đăng nhập hoặc mật khẩu!'
      end
      render :login
    end
  end

  def logout
    session[:user_id] = nil 
    redirect_to root_path
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:account, :name, :password, :role, :coin)
    end
end
