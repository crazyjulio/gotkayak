class Event < ApplicationRecord
  mount_uploader :image, ImageUploader

  NEWS_MAX = 900
  NEWS_MIN = 500
  EVENT_MAX = 300
  EVENT_MIN = 100

  validates :name, :body, :tag, presence: true
  # I want different character limits for when an item is an event and when it is news
  validates :body, length: { minimum: EVENT_MIN, maximum: EVENT_MAX }, unless: :is_news?
  validates :body, length: { minimum: NEWS_MIN, maximum: NEWS_MAX }, unless: :is_event?

  def self.get_news
    Event.where("tag = 'News'").last
  end

  def self.get_events
    Event.where("tag = 'Event'").limit(2).order('created_at desc')
  end

  def is_news?
    tag == 'News'
  end

  def is_event?
    tag == 'Event'
  end

  def text_area_rows
    limit = case tag
            when 'Event' then 8
            when 'News' then 25
            else 25
    end
  end

  def min_characters
    tag == 'Event' ? EVENT_MIN : NEWS_MIN
  end

  def max_characters
    tag == 'News' ? NEWS_MAX : EVENT_MAX
  end
end
