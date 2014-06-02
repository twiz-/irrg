class ReviewsController < ApplicationController
  before_filter :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end
  def thanks
  end

  # GET /reviews/new
  def new
    @review = Review.new
    render layout: false
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        # TODO redirect to page that shows what their review will look like. 
        format.html { redirect_to thanks_path, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def visible
    if params[:commit] == "Make Visible"
      current_user.reviews.where(id: params[:review_ids]).update_all(visibility: true)
      redirect_to location_path(current_user.reviews.first.location.id)
    elsif params[:commit] == "Make Not Visible"
      current_user.reviews.where(id: params[:review_ids]).update_all(visibility: false)
      redirect_to location_path(current_user.reviews.first.location.id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = current_user.reviews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:product_image, :email, :location_id, :comment, :reviewer_image, :visibility, :product_name, :first_name, :last_name)
    end
end
