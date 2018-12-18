# only for build use!

FactoryBot.define do
  factory :zebra_default_product_line, class: 'Zebra::Data::ProductLine' do
    order {'1234'}
    size {'888*999'}
    customer {'Dexter Morgan'}
    holes {'4'}
    delivery {'1155 103rd St. Miami Beach'}
    polish {'Flat Polish'}
    product {'Float 4mm. Clear'}
    tempered {'Tempered'}
    description {'Garden Window'}
    barcode {'00123456'}
  end
end
