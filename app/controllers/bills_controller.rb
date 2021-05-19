class BillsController < ApplicationController
  # GET /bills or /bills.json
  def index
    @bills = Bill.all
  end

  # GET /bills/1 or /bills/1.json

  def show
    @bill = Bill.find(params[:id])
  end

  # GET /bills/new
  def new
    @bill = Bill.new()
  end

  # GET /bills/1/edit
  def edit
  end

  # bill /bills or /bills.json
  def create
    @bill = current_user.bills.build(bill_params)
    @post = Post.find(params[:id])
    end_date =  @bill[:return_date]
    start_date =   @bill[:rent_date]
    @bill[:amount] = ((end_date.to_date - start_date.to_date).to_i + 1) * @post[:price]
<<<<<<< HEAD
    @bill[:condtn] = "chưa cho thuê"
    respond_to do |format| 
=======
    respond_to do |format|
>>>>>>> upstream/master
      if @bill.save
        format.html { redirect_to '/posts/'+params[:id], success: "đặt xe thàng công" }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @Bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1 or /bills/1.json
  def update
    respond_to do |format|
      if @Bill.update(bill_params)
        format.html { redirect_to @bill, notice: "bill was successfully updated." }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @Bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1 or /bills/1.json
  def destroy
    @Bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: "bill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:user_id, :post_id, :return_date, :rent_date)
    end

end
