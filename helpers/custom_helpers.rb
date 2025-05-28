require 'time'

module CustomHelpers
  DJ_SETS = ['GOSH DJ'].freeze

  def gig_duration(timeslot, performer)
    start_time = Time.parse(format_to_time(timeslot))
    end_time = start_time + (30 * 60)
    if DJ_SETS.include? performer
      "#{start_time.strftime('%H:%M')}-"
    else
      "#{start_time.strftime('%H:%M')}-#{end_time.strftime('%H:%M')}"
    end
  end

  def format_to_time(timeslot)
    timeslot.sub('-', ':')
  end

  def change_locale(locale)
    sitemap.find_resource_by_destination_path(
      File.join(locale == :hu ? '' : "#{locale}/", current_page.destination_path)
    )&.url || '/'
  end
end
