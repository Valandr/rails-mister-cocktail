# class IngredientsController < ApplicationController
#   def index
#   end

#   def show
#   end

#   def new
#   end

#   def create
#     @ingredient = Ingredient.new(ingredient_params)
#     if @ingredient.save
#       redirect_to ingredient_path(@ingredient)
#     else
#       render :new
#     end
#   end

#   def edit
#   end

#   def update
#   end

#   private

#   def ingredient_params
#     params.require(:ingredient).permit(:name)
#   end

#   def destroy
#     @ingredient = Ingredient.find(params[:id])
#     @ingredient.destroy

#     # no need for app/views/ingredients/destroy.html.erb
#     redirect_to ingredients_path
#   end
# end

class IngredientsController < ApplicationController
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to cocktails_ingredients_path(@ingredient)
    else
      render 'cocktails/show'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
