class WorkLog < ApplicationRecord
  # we log when a user completes a work
  belongs_to :tracking
  belongs_to :user

  delegate :username, to: :user, prefix: true, allow_nil: false

  delegate :unit_workload, to: :tracking, prefix: true, allow_nil: false

  delegate :cut?, to: :tracking, prefix: true, allow_nil: false
  delegate :drill?, to: :tracking, prefix: true, allow_nil: false
  delegate :polish?, to: :tracking, prefix: true, allow_nil: false
  delegate :temper?, to: :tracking, prefix: true, allow_nil: false
  delegate :delivery?, to: :tracking, prefix: true, allow_nil: false

  def workload
    tracking_unit_workload * quantity
  end
end
