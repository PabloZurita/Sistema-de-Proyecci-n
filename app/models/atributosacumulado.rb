class Atributosacumulado < ApplicationRecord
	before_create :set_id_atr_acumulado
	def set_id_atr_acumulado
	last_id_atr_acumulado = Atributosacumulado.maximum(:id_atr_acumulado)
	self.id_atr_acumulado = last_id_atr_acumulado.to_i + 1
end

end
