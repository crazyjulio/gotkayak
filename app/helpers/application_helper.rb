module ApplicationHelper
  def snippet(text, options = {})
    opts = { word_count: 20 }.merge(options)
    text.split[0..(opts[:word_count] - 1)].join(' ') + (text.split.size > opts[:word_count] ? '...' : '')
  end

  def adventure_page?
    current_page?(adventures_path) || (controller_name == 'waterbodies' && action_name == 'show') || (controller_name == 'trips' && action_name == 'show')
  end
end
