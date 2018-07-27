class DosesController < ApplicationController

  def new
    # (wwww.cocktail.com/cocktails/1/doeses/new)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @size = [ "", "cans", " slice ", "tablespoon", "dash", "splash", "teaspoon", "tablespoon", "oz", "snit", "wineglass", "cup", "1 pint", "1 split"]
    @amount = ["1/8", "3/8", "5/8", "1/4","3/4", "1/2", "2", "2 1/2", "3","3 1/2", "4", "5", "6"]
    # @description = @size + @amount
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    # cocktails/:cocktail_id/doses(.:format)

    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save!
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

  end

  def destroy
    # www.cocktail.com/doses/:id(.:format)
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path
  end

private
def dose_params
  params.require(:dose).permit(:ingredient_id, :description_amount, :description_unit)
end

end
