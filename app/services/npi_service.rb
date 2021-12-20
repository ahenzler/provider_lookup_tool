class NpiService
  class << self
    def get_search_results(first_name, last_name, state_initials, specialty)
      response = connection.get(url(first_name, last_name, state_initials, specialty))
      JSON.parse(response.body, symbolize_names: true)
    end

    private
    def connection
      Faraday.new('https://npiregistry.cms.hhs.gov')
    end

    def url(first_name, last_name, state_initials, specialty)
      "/api/?version=2.0&first_name=#{first_name}&last_name=#{last_name}&state=#{state_initials}&taxonomy_description=#{specialty}&limit=200"
    end
  end
end
