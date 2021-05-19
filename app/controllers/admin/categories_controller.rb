<<<<<<< HEAD
class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /Categories or /Categories.json
  def index
    @categories = Category.all
    @brands = Brand.all
  end

  # GET /Categories/1 or /Categories/1.json
  def show
  end

  # GET /Categories/new
  def new
    @category = Category.new
    @brand = Brand.new
    @categories = Category.all
  end

  # GET /Categories/1/edit
  def edit
  end

  # POST /Categories or /Categories.json
  def create
    @brand = Brand.new()
    @category = Category.new(category_params)
    respond_to do |format|
      if params[:typecategory] == "category"
        if @category.save
          format.html { redirect_to @category, notice: "category was successfully created." }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      else
        @brand[:name] = @category.name
        if @brand.save
          format.html { redirect_to @category, notice: "category was successfully created." }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /Categories/1 or /Categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Categories/1 or /Categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to Categories_url, notice: "category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end

    
end
=======
class Admin::BrandsController < ActionController::Base
	helper_method  :current_user

  def index
    @users = User.all
  end

end
>>>>>>> upstream/master
