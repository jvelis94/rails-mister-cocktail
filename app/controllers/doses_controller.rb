class DosesController < ApplicationController
    before_action :find_dose, only: [:show]
      # GET /dose/new
    def new
        @dose = Dose.new
    end
    
      # POST /restaurants
      # POST /restaurants.json
    def create
        @cocktail = Cocktail.find(params[:cocktail_id])
        @dose = Dose.create(dose_params)
        @dose.cocktail = @cocktail
        if @dose.save
            redirect_to cocktail_path(@cocktail)
          else
            # if invalid the object now has errors inside it.
            render 'cocktails/show'
          end
    end

    def destroy
        @dose = Dose.find(params[:id])
        @dose.destroy
        redirect_to cocktail_path(@dose.cocktail)
    end

    private


    def dose_params
        params.require(:dose).permit(:description, :ingredient_id)
    end

    def find_dose
        @dose = Dose.find(params[:id])
    end
end
