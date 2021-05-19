class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :set_user, only: %i[ show edit update destroy topup]
  skip_before_action :verify_authenticity_token , :only => [:topup]
=======
  before_action :set_user, only: %i[ show edit update destroy ]
>>>>>>> upstream/master

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
<<<<<<< HEAD
    @post_accepted = Post.where(user_id: params[:id], status: "đã duyệt")
    @post_pending = Post.where(user_id: params[:id], status: "chưa duyệt")
    @post_refused = Post.where(user_id: params[:id], status: "từ chối")
    @bill_rent = Bill.select('posts.*, bills.*').joins(:post).where(user_id: params[:id])
  end

  def topup
    bank = Bank.find_by(code: params[:code], seri: params[:seri])
    respond_to do |format| 
      unless bank.nil?
        if(bank.status == "valid")
          @user.coin += bank.price
          bank.status = "expire"
          bank.save
          @user.save
          format.html { redirect_to @user, success: "chúc mừng bạn đã nạp thành công "+bank.price.to_s+" vào tài khoản" }
        else 
          format.html { redirect_to @user, warning: "thẻ đã được sử dụng" }
        end
      else
        format.html { redirect_to @user, danger: "bạn đã nhập sai số seri hoặc mã thẻ" }
      end
    
    end

=======
     @user = User.find(params[:id])
     @posts = Post.where(user_id: params[:id])
>>>>>>> upstream/master
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
<<<<<<< HEAD

=======
>>>>>>> upstream/master
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
