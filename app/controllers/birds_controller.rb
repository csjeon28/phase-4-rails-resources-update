class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  # PATCH /birds/:id
  def update
    # find bird that matches id param
    bird = Bird.find_by(id: params[:id])
    if bird
      bird.update(bird_params)
      render json: bird 
    else
      render json: {error: "Bird Not Found"}, status: :not_found
    end
  end

  def increment_likes
    # find bird that we're trying to update
    bird = Bird.find_by(id: params[:id])
    # update the bird using the number of CURRENT likes + 1 to determine next number of likes
    bird.update(likes: bird.likes + 1)
    render json: bird 
  end

  

  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

end
