class CharacterController < ApplicationController
  protect_from_forgery with: :null_session
  require 'byebug'

  def create 
    character = Character.new(character_params)

    if (character.save)
      respond_to do |format|
        format.json { render json: { status: 'success', character: character_params }, status: 200 }
      end
      return 

    else
      respond_to do |format|
        format.json { render json: { status: 'error', erors: character.erors }, status: 500 }
      end
      return 
    end

  end

  def read

    respond_to do |format|
      data = Character.joins("JOIN races on (race_id = races.id)")
                      .joins("JOIN character_classes on (class_id = character_classes.id)")
                      .select("races.name as race, characters.name, characters.id, character_classes.name as className")
      format.json { render json: { status: 'success', character_class: data }, status: 200 }
    end
  end

  def show

    respond_to do |format|
      data = Character.joins("JOIN races on (race_id = races.id)")
                      .joins("JOIN character_classes on (class_id = character_classes.id)")
                      .where(id: params[:id])
                      .select("races.name as race, characters.name, characters.id, character_classes.name as className")
      format.json { render json: { status: 'success', character_class: data }, status: 200 }
    end
  end

  def update 

    character = Character.find(params[:id])

    if (character.update(character_params))
      respond_to do |format|
        format.json { render json: { status: 'success', character: character_params }, status: 201 }
      end
      return 

    else
      respond_to do |format|
        format.json { render json: { status: 'error', erors: character.erors }, status: 500 }
      end
      return 
    end

  end

  def delete 

    character = Character.find(params[:id])
    character.destroy

    respond_to do |format|
      format.json { render json: { status: 'success' }, status: 204 }
    end

  end

  def classes
    respond_to do |format|
      data = CharacterClass.select("id, name, description")
      format.json { render json: { status: 'success', classes: data }, status: 200 }
    end
  end

  private

  def character_params
    params.require(:character).permit(:user_id, :race_id, :class_id, :name, :level, :health_points, :actual_health_points, :inspiration, :charism, :inteligence, :wisdom, :constituition, :dezterity, :strength, :align, :size)	
  end
end
