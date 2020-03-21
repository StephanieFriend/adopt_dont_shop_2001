class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    pet = Pet.new({
                      image: params[:image],
                      name: params[:name],
                      description: params[:description],
                      approximate_age: params[:approximate_age],
                      sex: params[:sex],
                      shelter: Shelter.find(params[:shelter_id]),
                      adoptable: params[:adoptable]
                  })
    pet.save
    redirect_to "/shelters/#{params[:shelter_id]}"
  end

  def show
    @pet = Pet.find(params[:id])
  end
end