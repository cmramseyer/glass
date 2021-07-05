require 'rails_helper'

RSpec.describe Notify, type: :model do
  context 'a valid product line' do

    let(:order) { Order.new(id: 99) }
    let(:exception) { RuntimeError.new("runtime error") }

    xit 'is valid' do
      expect { Notify.activation_success(order) }.to have_broadcasted_to("notification_channel").with(type: 'success', delay: 8000, message: 'Order 99 was successfuly activated! Please refresh the Orders page')
    end

    xit 'is valid 22' do
      expect { Notify.activation_fail(order, exception) }.to have_broadcasted_to("notification_channel").with(type: 'error', delay: 12000, message: 'Order 99 Activation failed: runtime error')
    end

    xit 'is valid 223' do
      expect { Notify.unexpected }.to have_broadcasted_to("notification_channel").with(type: 'error', delay: 12000, message: 'Unexpected exception. Please check the log!')
    end

  end
end
