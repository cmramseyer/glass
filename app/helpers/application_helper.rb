module ApplicationHelper

  def priority_label(priority)
    case priority
    when '1 - High' then color = 'danger'
    when '2 - Normal' then color = 'success'
    when '3 - Low' then color = 'info'
    end
    "<span class='label label-#{color}'>#{priority}</span>".html_safe
  end

  def last_activation_message_tooltip(message)
    "<i class='fa fa-eye' data-toggle='tooltip' data-placement='top' data-original-title='#{message}'></i>".html_safe
  end

  def complete_work(tracking)

    link_to "Complete Work", tracking_perform_work_index_path(tracking_id: tracking.id), method: :post, class: 'btn btn-success btn-xs', data: { toggle: 'tooltip', placement: 'top', original_title: tracking.stage.complete_work_tooltip_message } if tracking.available_works?
  end

  def formatted_date(date)
    date.strftime('%m/%d/%y %H:%M')
  end

  
end
