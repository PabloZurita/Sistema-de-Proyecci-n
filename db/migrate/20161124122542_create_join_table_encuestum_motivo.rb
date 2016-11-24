class CreateJoinTableEncuestumMotivo < ActiveRecord::Migration[5.0]
  def change
    create_join_table :encuesta, :motivos, :id => false do |t|
       t.index [:encuestum_id, :motivo_id]
       t.index [:motivo_id, :encuestum_id]
    end
    add_foreign_key :encuesta_motivos, :encuesta
	add_foreign_key :encuesta_motivos, :motivos
  end
end
