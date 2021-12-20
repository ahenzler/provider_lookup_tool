class NpiService
  class << self
    def get_search_results_first_name_last_name(first_name, last_name)
    response = Faraday.get("https://npiregistry.cms.hhs.gov/api/?version=2.0&first_name=#{first_name}&last_name=#{last_name}&limit=200")
    JSON.parse(response.body, symbolize_names: true)
    end

    def get_search_results_last_name_state_initials(last_name, state_initials)
    response = Faraday.get("https://npiregistry.cms.hhs.gov/api/?version=2.0&last_name=#{last_name}&state=#{state_initials}&limit=200")
    JSON.parse(response.body, symbolize_names: true)
    end

    def get_search_results_state_initials_specialty(state_initials, specialty)
    response = Faraday.get("https://npiregistry.cms.hhs.gov/api/?version=2.0&state=#{state_initials}&taxonomy_description=#{specialty}&limit=200")
    JSON.parse(response.body, symbolize_names: true)
    end
  end

  private
  def connection
    Farday.new('https://npiregistry.cms.hhs.gov/api/?version=2.0')
  end
end
