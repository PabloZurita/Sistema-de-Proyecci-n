class Motivo < ApplicationRecord
	has_and_belongs_to_many :encuesta
before_create :set_id_motivo
def set_id_motivo
	last_id_motivo = Motivo.maximum(:id_motivo)
	self.id_motivo = last_id_motivo.to_i + 1
end

end
