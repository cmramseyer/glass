class PolishTypeSerializer < ActiveModel::Serializer

  
  attributes :name


  # link(:related) {api_v1_order_path(id: object.id)}

end
