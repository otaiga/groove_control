# Manger for pusher messages
class PusherManager

  Pusher.app_id = Rails.application.config.pusher_app_id
  Pusher.key = Rails.application.config.pusher_key
  Pusher.secret = Rails.application.config.pusher_secret

  def push_channel
    Rails.application.config.pusher_channel
  end

  def transmit(event, data)
    Pusher.trigger(push_channel, event, data)
  end

  def settings
    {
      app_id: Pusher.app_id,
      app_key: Pusher.key,
      app_secret: Pusher.secret,
      app_channel: push_channel

    }
  end
end