class Event < ActiveRecord::Base
  before_destroy :destroy_image

  NEWS_MAX = 900
  NEWS_MIN = 500
  EVENT_MAX = 300
  EVENT_MIN = 100

  has_one :image

  validates :name, :body, :tag, :presence => true
  #I want different character limits for when an item is an event and when it is news
  validates :body, :length => {:minimum => EVENT_MIN, :maximum => EVENT_MAX}, :unless => :is_news?
  validates :body, :length => {:minimum => NEWS_MIN, :maximum => NEWS_MAX}, :unless => :is_event?

  def destroy_image
    self.image.destroy if self.image
  end

  def self.get_news
    Event.where("tag = 'News'").last
  end

  def self.get_events
    Event.where("tag = 'Event'").limit(2).order("created_at desc")
  end

  def is_news?
    self.tag == 'News' ? true : false
  end

  def is_event?
    self.tag == 'Event' ? true : false
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

  def image
    Image.where(["model=? and model_id=?","Event",self.id]).limit(1)[0]
  end

  def self.image_limit
    1
  end
end
