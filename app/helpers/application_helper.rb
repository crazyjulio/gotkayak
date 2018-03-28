module ApplicationHelper
  def snippet(text, options = {})
    opts = { word_count: 20 }.merge(options)
    text.split[0..(opts[:word_count] - 1)].join(' ') + (text.split.size > opts[:word_count] ? '...' : '')
  end

  def adventure_page?
    current_page?(adventures_path) || (controller_name == 'waterbodies' && action_name == 'show') || (controller_name == 'trips' && action_name == 'show')
  end

  def comment_decorator(type)
    case type
    when 'dispute'
      'border-danger'
    when 'resolution'
      'border-success'
    else
      ''
    end
  end

  def card_decorator(type)
    case type
    when 'dispute'
      'text-danger'
    when 'resolution'
      'text-success'
    else
      ''
    end
  end

  def commenter(user_id)
    User.find(user_id)
  end

  alias competitor commenter

  def comment_time_formatter(time)
    Time.parse(time).strftime('%-m/%-d @%l:%M %P')
  end

  def comment_belongs_to_current_user?(user_id)
    user_id == current_user.id
  end

  def prefix_comment(type)
    "#{type.capitalize}: " unless type.casecmp('regular').zero?
  end
end
