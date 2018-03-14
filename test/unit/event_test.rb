require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'get_news' do
    news = Event.get_news

    assert_equal('More new kayaks', news.name)
  end

  test 'get_events' do
    events = Event.get_events

    assert_equal(2, events.length)
    assert_equal('Real Big Deal', events[0].name)
    assert_equal('Went a paddling', events[1].name)
  end

  test 'is_news?' do
    @event1 = Event.new(tag: 'News')
    @event2 = Event.new(tag: 'Event')

    assert_equal(true, @event1.is_news?)
    assert_equal(false, @event2.is_news?)
  end

  test 'is_event?' do
    @event1 = Event.new(tag: 'News')
    @event2 = Event.new(tag: 'Event')

    assert_equal(false, @event1.is_event?)
    assert_equal(true, @event2.is_event?)
  end

  test 'text_area_rows' do
    @event1 = Event.new(tag: 'News')
    @event2 = Event.new(tag: 'Event')

    assert_equal(25, @event1.text_area_rows)
    assert_equal(8, @event2.text_area_rows)
  end

  test 'min_characters' do
    @event1 = Event.new(tag: 'News')
    @event2 = Event.new(tag: 'Event')

    assert_equal(500, @event1.min_characters)
    assert_equal(100, @event2.min_characters)
  end

  test 'max_characters' do
    @event1 = Event.new(tag: 'News')
    @event2 = Event.new(tag: 'Event')

    assert_equal(900, @event1.max_characters)
    assert_equal(300, @event2.max_characters)
  end
end
