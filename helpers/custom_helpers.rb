module CustomHelpers
  def localized_root_url
    I18n.locale == :hu ? '/' : "/#{I18n.locale}/"
  end
end
