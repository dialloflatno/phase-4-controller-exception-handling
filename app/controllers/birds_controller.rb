class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    if bird
      render json: bird
    else
      render_not_found_response   
    end
  end

  # PATCH /birds/:id
  def update
    if bird
      bird.update(bird_params)
      render json: bird
    else
      render_not_found_response   
    end
  end

  # PATCH /birds/:id/like
  def increment_likes
    if bird
      bird.update(likes: bird.likes + 1)
      render json: bird
    else
      render_not_found_response   
    end
  end

  # DELETE /birds/:id
  def destroy
    if bird
      bird.destroy
      head :no_content
    else
      render_not_found_response   
    end
  end
end
