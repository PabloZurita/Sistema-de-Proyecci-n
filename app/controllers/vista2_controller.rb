class Vista2Controller < ApplicationController
	
  def index
  	@indicadoresdiarios = Indicadoresdiario.all
  end
end
