class CharacterClassController < ApplicationController
  protect_from_forgery with: :null_session

  def read
    respond_to do |format|
      data = CharacterClass.select("id, name, description")
      format.json { render json: { status: 'success', classes: data }, status: 200 }
    end
  end

end
