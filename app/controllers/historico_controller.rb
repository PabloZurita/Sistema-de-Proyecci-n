class HistoricoController < ApplicationController

  def index
  	@indicadoresdiarios = Indicadoresdiario.all
  end
end
