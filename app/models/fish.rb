class Fish < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :user
  belongs_to :competition

  validates :species, :location, :catch_date, presence: true
  validates :images, valid_number_of_images: true
  validates :catch_date, valid_catch_date: true
  validates :weight, numericality: { only_integer: true }, if: :weight
  validates :length, numericality: { only_integer: true }, if: :length

  before_validation(on: :create) do
    self.competition_id = Competition.find_by_year(Date.today.year).id
  end

  scope :most_recent, -> { order('created_at DESC') }
  scope :disputed, -> { where('disputed_by is not null') }
  scope :not_disputed, -> { where('disputed_by is null') }

  def user_name
    user.name
  end

  def user_image
    user.image.thumb.url
  end

  def user_to_param
    user.to_param
  end

  def display_weight
    "#{Measured::Weight.new(weight, 'oz').convert_to('lb').format('%.2<value>f')} lbs" if weight
  end

  def display_length
    "#{Measured::Length.new(length, 'in').convert_to('ft').format('%.2<value>f')} feet" if length
  end

  def self.recent_comments_for_notification(days_in_the_past:)
    Fish.all.select(&:comments).collect(&:comments).flatten.select { |comment| comment['comment_time'] >= (Time.now - days_in_the_past.days) }.length
  end

  def self.recent_fish_for_notification(days_in_the_past:)
    Fish.where("created_at > '#{(Time.now - days_in_the_past.days).to_s(:db)}'").count
  end
end
