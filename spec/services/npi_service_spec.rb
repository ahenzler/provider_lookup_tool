require 'rails_helper'

RSpec.describe 'the NPI service' do
  context 'returns data correctly' do
    it 'can search by full name' do
      data = NpiService.get_search_results("Mark", "Henzler", "", "")

      expect(data).to be_a(Hash)
      expect(data).to have_key(:results)
      expect(data[:results]).to be_a(Array)
      expect(data[:results][0][:basic][:first_name]).to eq('MARK')
      expect(data[:results][0][:basic][:last_name]).to eq('HENZLER')
    end

    it 'can search by last name and state' do
      data = NpiService.get_search_results("", "Henzler", "ID", "")

      expect(data).to be_a(Hash)
      expect(data).to have_key(:results)
      expect(data[:results]).to be_a(Array)
      expect(data[:results][0][:basic][:first_name]).to eq('MARK')
      expect(data[:results][0][:basic][:last_name]).to eq('HENZLER')
    end

    it 'can search by state and specialty' do
      data = NpiService.get_search_results("", "", "ID", "Emergency Medicine")

      expect(data).to be_a(Hash)
      expect(data).to have_key(:results)
      expect(data[:results]).to be_a(Array)
      expect(data[:results][0][:basic][:first_name]).to be_a(String)
      expect(data[:results][0][:basic][:last_name]).to be_a(String)
    end
  end
end