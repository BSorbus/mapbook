# frozen_string_literal: true

ActiveSupport::Notifications.subscribe('rack.attack') do |_name, _start, _finish, _request_id, req|
  if req.env['rack.attack.match_type'] == :throttle
    Rails.logger.info '--------------------------------------------------'
    Rails.logger.info "Throttled IP: #{req.ip}"
    Rails.logger.info '--------------------------------------------------'
  end
end
