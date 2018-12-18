class ProductLineSerializer < ActiveModel::Serializer

  include Rails.application.routes.url_helpers

  attributes :quantity, :width, :height, :holes_quantity, :tempered
  belongs_to :product, serializer: ProductSerializer
  belongs_to :polish_type, serializer: PolishTypeSerializer
  


  # link(:related) {api_v1_order_path(id: object.id)}

end
