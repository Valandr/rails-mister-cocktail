class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :destroy, :edit]

  def index
    @doses = Dose.all
  end

  def show
  end
  # def new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.new
  # end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @ingredient = Ingredient.new
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:cocktail_id, :description, :ingredient_id)
  end
end

  def set_dose
    @dose = Dose.find(params[:id])
  end
