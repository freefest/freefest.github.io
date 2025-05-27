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

  def localized_url_for(path)
    default_locale = :hu
    locale = I18n.locale

    if locale == default_locale
      path
    else
      File.join('/', locale.to_s, path).gsub(%r{/+}, '/')
    end
  end

  def change_locale(locale)
    url_regex = %r{\A/(?:(#{I18n.available_locales.join('|')})/)?}
    locale_root = url_for('/', locale:)
    if current_page.url.gsub(url_regex, '').blank?
      locale_root
    else
      current_page.url.gsub(url_regex, locale_root)
    end
  end
end
