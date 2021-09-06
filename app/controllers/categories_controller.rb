class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user
  # GET /categories or /categories.json
  def index
    @categories = Category.all.order_by_name
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
     @category = Category.new(category_params)
      c = Category.where('lower(name) = ?', category_params[:name].downcase)   
       
      if c.length == 0     
      
        respond_to do |format|
          if @category.save
            format.html { redirect_to categories_path, notice: "Category was successfully created." }
            format.json { render :show, status: :created, location: @category }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @category.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render @category.errors, status: :unprocessable_entity }   
        end 
      end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    c = Categry.where('lower(name) = ?', category_params[:name].downcase)

    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def correct_user
    if current_user.user_type_id  == 1
      redirect_to root_path, notice: "Not authorised"
    end
  end 

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.active = !@category.active
    @category.save
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully deleted." }
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
      params.require(:category).permit(:name, :description, :bggroundimage)
    end
end
