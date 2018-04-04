require "#{Rails.root}/app/services/notification"
include Notification

namespace :notify do
  desc 'Notify users subscribed to daily fish summary'
  task daily_fish: :environment do
    count = Fish.recent_fish_for_notification(days_in_the_past: 1)
    send_notification(segments: ['Daily Fish'], message: "#{count} fish reported in the past day. Log in to check them out.") unless count == 0
  end

  desc 'Notify users subscribed to weekly fish summary'
  task weekly_fish: :environment do
    count = Fish.recent_fish_for_notification(days_in_the_past: 7)
    send_notification(segments: ['Weekly Fish'], message: "#{count} fish reported in the past week. Log in to check them out.") unless count == 0
  end

  desc 'Notify users subscribed to daily comment summary'
  task daily_comments: :environment do
    count = Fish.recent_comments_for_notification(days_in_the_past: 1)
    send_notification(segments: ['Daily Comments'], message: "#{count} comments made in the past day. Log in to check them out.") unless count == 0
  end

  desc 'Notify users subscribed to weekly comment summary'
  task weekly_comments: :environment do
    count = Fish.recent_comments_for_notification(days_in_the_past: 7)
    send_notification(segments: ['Weekly Comments'], message: "#{count} comments made in the past week. Log in to check them out.") unless count == 0
  end
end
