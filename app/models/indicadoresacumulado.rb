class Indicadoresacumulado < ApplicationRecord
	before_create :set_id_ind_acumulado
	def set_id_ind_acumulado
	last_id_ind_acumulado = Indicadoresacumulado.maximum(:id_ind_acumulado)
	self.id_ind_acumulado = last_id_ind_acumulado.to_i + 1
end

end
