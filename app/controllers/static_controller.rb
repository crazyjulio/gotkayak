class StaticController < ApplicationController
  def index
    @events = Event.get_events
    @news = Event.get_news
  end
end
