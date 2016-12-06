class Mdp < ApplicationRecord
	has_and_belongs_to_many :pagos
before_create :set_id_mdp
def set_id_mdp
	last_id_mdp = Mdp.maximum(:id_mdp)
	self.id_mdp = last_id_mdp.to_i + 1
end

end
