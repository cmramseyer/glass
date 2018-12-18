class ProductSerializer < ActiveModel::Serializer

  
  attributes :name, :code


  # link(:related) {api_v1_order_path(id: object.id)}

end
