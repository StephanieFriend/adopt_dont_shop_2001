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
                      adoptable: "Y"
                  })
    pet.save
    redirect_to "/shelters/#{params[:shelter_id]}/pets"
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
                   image: params[:image],
                   name: params[:name],
                   description: params[:description],
                   approximate_age: params[:approximate_age],
                   sex: params[:sex],
                   adoptable: params[:adoptable]
               })
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end
end