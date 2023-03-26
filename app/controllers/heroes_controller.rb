class HeroesController < ApplicationController
    def index
      heroes = Hero.all
      render json: heroes, each_serializer: HeroSerializer
    end
  
    def show
      hero = Hero.find(params[:id])
      render json: hero, serializer: HeroSerializer
    end
  
    def create
      hero = Hero.new(hero_params)
  
      if hero.save
        render json: hero, serializer: HeroSerializer
      else
        render json: { errors: hero.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      hero = Hero.find(params[:id])
  
      if hero.update(hero_params)
        render json: hero, serializer: HeroSerializer
      else
        render json: { errors: hero.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      hero = Hero.find(params[:id])
      hero.destroy
  
      head :no_content
    end
  
    private
  
    def hero_params
      params.require(:hero).permit(:name, :real_name, :description, :superpowers, :publisher_id)
    end
  end
  