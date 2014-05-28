require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "display_name" do
    @image1 = images(:one)
    @image2 = images(:event_image)
    @image3 = images(:paddler_image)

    #Malibu X Factor is a combination of Manufacturer name and Product name, assembled because Product responds to :full_name
    assert_equal("Malibu X Factor", @image1.display_name)
    #Real Big Deal is the title of an Event
    assert_equal("Real Big Deal", @image2.display_name)
    #JJ is the name of one of the paddlers
    assert_equal("JJ", @image3.display_name)
  end
end
