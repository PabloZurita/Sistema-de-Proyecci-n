class Indicadoresdiario < ApplicationRecord
	before_create :set_id_ind_diario
	def set_id_ind_diario
		last_id_ind_diario = Indicadoresdiario.maximum(:id_ind_diario)
		self.id_ind_diario = last_id_ind_diario.to_i + 1
	end
end
