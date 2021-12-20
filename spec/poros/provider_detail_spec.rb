require 'rails_helper'

RSpec.describe ProviderDetail do
  it 'should build provider detail object' do
    provider_info = { :enumeration_type=>"NPI-1",
                      :number=>1518904598,
                      :basic=>
                        {:first_name=>"MARK",
                        :last_name=>"HENZLER",
                        :middle_name=>"A",
                        :credential=>"M.D.",
                        :sole_proprietor=>"NO",
                        :gender=>"M",
                        :enumeration_date=>"2006-05-31",
                        :last_updated=>"2015-09-25",
                        :status=>"A",
                        :name=>"HENZLER MARK"},
                      :other_names=>[],
                      :addresses=>
                        [{:country_code=>"US",
                          :country_name=>"United States",
                          :address_purpose=>"LOCATION",
                          :address_type=>"DOM",
                          :address_1=>"1055 N CURTIS RD",
                          :address_2=>"",
                          :city=>"BOISE",
                          :state=>"ID",
                          :postal_code=>"837061352",
                          :telephone_number=>"208-322-1730",
                          :fax_number=>"208-322-1731"},
                        {:country_code=>"US",
                          :country_name=>"United States",
                          :address_purpose=>"MAILING",
                          :address_type=>"DOM",
                          :address_1=>"2963 E COPPER POINT DR",
                          :address_2=>"SUITE 150",
                          :city=>"MERIDIAN",
                          :state=>"ID",
                          :postal_code=>"836429055",
                          :telephone_number=>"208-322-1730",
                          :fax_number=>"208-322-1731"}],
                      :taxonomies=>[{:code=>"207P00000X", :desc=>"Emergency Medicine", :primary=>true, :state=>"ID", :license=>"M5418"}],
                      :identifiers=>[{:identifier=>"003741300", :code=>"05", :desc=>"MEDICAID", :state=>"ID", :issuer=>""}]
                    }

    providers = ProviderDetail.new(provider_info)

    expect(providers).to be_a(ProviderDetail)
    expect(providers.full_name).to eq('MARK HENZLER')
    expect(providers.npi_number).to eq(1518904598)
    expect(providers.address_list).to eq("1055 N CURTIS RD, BOISE, ID, 837061352, 208-322-1730")
  end
end