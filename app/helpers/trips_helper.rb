module TripsHelper

  def add_paddler_kayak_link(name, f)
    new_object = Paddler.new
    fields = f.fields_for(:paddler_kayak, new_object, :child_index => "new_paddler") do |builder|
      render("paddler_kayak")#, :locals => {:f => builder}
    end
    link_to_function(name, "add_fields(this, 'Paddler', '#{escape_javascript(fields)}')")
  end

end
