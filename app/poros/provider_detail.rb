class ProviderDetail
  attr_reader :full_name,
              :npi_number,
              :address_list


  def initialize(data)
    @full_name = find_full_name(data)
    @npi_number = data[:number]
    @address_list = addresses(data)
  end

  def find_full_name(data)
    first_name = data[:basic][:first_name]
    last_name = data[:basic][:last_name]
    if !first_name.nil?
      first_name.concat(" ",last_name)
    else
      data[:basic][:name]
    end
  end

  def addresses(data)
    street_address_1 = data[:addresses][0][:address_1]
    street_address_2 = data[:addresses][0][:address_2]
    city = data[:addresses][0][:city]
    state = data[:addresses][0][:state]
    zip_code = data[:addresses][0][:postal_code]
    telephone = data[:addresses][0][:telephone_number]
    street_address_1.concat(street_address_2) unless street_address_2.nil?
    address_list = [street_address_1, city, state, zip_code, telephone]
    address_list.compact.join(", ")
  end
end