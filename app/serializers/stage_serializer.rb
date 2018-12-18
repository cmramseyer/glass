class StageSerializer < ActiveModel::Serializer

  attributes :name

  link(:related) {api_v1_stage_path(id: object.id)}

end
