module CountryList
  def self.make_en
    make_locale(:en)
  end

  def self.make_fr
    make_locale(:fr)
  end

  private

  def self.make_locale(locale)
    @codes ||= YAML.load_file(Rails.root + 'db/countries/codes.yml')
    names = YAML.load_file(Rails.root + "db/countries/#{locale}.yml")
    Rails.logger.debug "Setting locale to: #{locale}"
    I18n.locale = locale

    if Country.find_by(numeric: @codes.first[:numeric])
      Country.transaction do
        names.each_with_index do |name, i|
          country = Country.find(i + 1)
          country.update(short_name: name[:short_name])
        end
      end
    else
      combined = []

      names.each_with_index do |name, i|
        combined[i] = name.merge(@codes[i])
      end

      Country.transaction do
        Country.create(combined)
      end
    end
  end
end
