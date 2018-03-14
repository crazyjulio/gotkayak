class StaticController < ApplicationController
  def index
    @events = Event.get_events
    @news = Event.get_news
  end

  def test_five_hundreds
    1 / 0
  end
end
