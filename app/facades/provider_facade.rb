class ProviderFacade
  def self.provider(first_name, last_name, state_initials, specialty)
    data = NpiService.get_search_results(first_name, last_name, state_initials, specialty)
    data[:results].map do |provider|
      ProviderDetail.new(provider)
    end
  end
end