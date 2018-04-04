module Notification
  def send_notification(segments:, message:)
    params = {
      app_id: ENV['GK_ONESIGNAL_APP_ID'],
      contents: {
        en: message
      },
      ios_badgeType: 'None',
      ios_badgeCount: 1,
      included_segments: segments
    }
    begin
      response = OneSignal::Notification.create(params: params)
      notification_id = JSON.parse(response.body)['id']
    rescue OneSignal::OneSignalError => e
      puts '--- OneSignalError  :'
      puts "-- message : #{e.message}"
      puts "-- status : #{e.http_status}"
      puts "-- body : #{e.http_body}"
    end
  end
end
