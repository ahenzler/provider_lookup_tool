require 'rails_helper'

RSpec.describe 'ProviderFacade' do
  it 'returns data correctly for facade' do
    data = ProviderFacade.provider('Mark', 'Henzler', '', '')

    expect(data.first).to be_a(ProviderDetail)
    expect(data.first.full_name).to eq('MARK HENZLER')
    expect(data.first.npi_number).to eq(1518904598)
    expect(data.first.address_list).to eq("1055 N CURTIS RD, BOISE, ID, 837061352, 208-322-1730")
  end
end