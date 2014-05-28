module ApplicationHelper
  def snippet(text, options={})
    opts = {:word_count => 20}.merge(options)
    text.split[0..(opts[:word_count]-1)].join(" ") + (text.split.size > opts[:word_count] ? "..." : "")
  end

  def display_paddler_and_kayak(paddler_kayak)
    paddlers, kayaks = [],[]
    paddler_kayak.each do |pk|
      if pk[0] == "paddler"
        pk[1].each do |paddler_id|
          begin
            paddlers << Paddler.find(paddler_id)
          rescue ActiveRecord::RecordNotFound
            paddlers << nil
          end
        end
      elsif pk[0] == "kayak"
        pk[1].each do |kayak_id|
          begin
            kayaks << Product.find(kayak_id)
          rescue ActiveRecord::RecordNotFound
            kayaks << nil
          end
        end
      end
    end
    return paddlers.zip(kayaks)
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def number_to_pounds(ounces)
    weight = Unit.new("#{ounces} oz").to_s(:lbs)
    weight = "#{weight.match(/^\d+\s\w+/).to_s}" if weight.match(/0 oz$/)
    weight
  end

  def number_to_feet(inches)
    Unit.new("#{inches} in").to_s(:ft)
  end
end
