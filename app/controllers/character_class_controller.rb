class CharacterClassController < ApplicationController
  def show
    respond_to do |format|
      data = Character.joins("JOIN races on (race_id = races.id)")
                      .joins("JOIN character_classes on (class_id = character_classes.id)")
                      .select("races.name as race, characters.name, characters.id, character_classes.name as classe")
      format.json { render json: { status: 'success', character_class: data.to_json }, status: 200 }
    end
  end
end
