class HistoricoController < ApplicationController
	before_action :set_indicadoresdiario, only: [:show, :edit, :update, :destroy]
  def index
  	@indicadoresdiarios = Indicadoresdiario.all
  end
end
