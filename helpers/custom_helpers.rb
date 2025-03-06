module CustomHelpers
  def format_to_time(timeslot)
    timeslot.sub('-', ':')
  end

  def localized_url_for(path)
    I18n.locale == :hu ? "./#{path}" : "../#{path}"
  end
end
