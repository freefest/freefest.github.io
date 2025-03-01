module CustomHelpers
  def localized_root_url
    I18n.locale == :hu ? '/' : "/#{I18n.locale}/"
  end

  def format_to_time(timeslot)
    timeslot.sub('-', ':')
  end
end
