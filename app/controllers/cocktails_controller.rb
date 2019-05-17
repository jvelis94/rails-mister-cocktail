class CocktailsController < ApplicationController
    before_action :find_cocktail, only: [:show, :destroy]

    def index
        @cocktails = Cocktail.all
    end
    

    def show
        @dose = Dose.new
    end
    
      # GET /cocktail/new
    def new
        @cocktail = Cocktail.new
    end
    
      # POST /restaurants
      # POST /restaurants.json
    def create
        @cocktail = Cocktail.create(cocktail_params)
        if @cocktail.save
            redirect_to cocktail_path(@cocktail)
          else
            # if invalid the object now has errors inside it.
            render :new
          end
    end

    private


    def cocktail_params
        params.require(:cocktail).permit(:name, :photo)
    end

    def find_cocktail
        @cocktail = Cocktail.find(params[:id])
    end
end
