require 'rails_helper'

RSpec.describe WeatherFacade do
  before do
    allow_any_instance_of(WestFLWXService).to receive(:querry).and_return({ data: 'No Current Alerts' })
    params = { email: 'email' }
    @facade = WeatherFacade.new(params)
    @facade.message
  end

  describe 'instance_methods' do
    describe '#message' do
      it 'returns a string objects from given search params' do
        expect(@facade.message).to be_a(String)
        expect(@facade.message).to eq('No Current Alerts')
      end
    end

    describe '#results' do
      it 'returns a JSON Hash of results from given search params' do
        expect(@facade.results).to be_a(Hash)
      end
    end

    describe '#service' do
      it 'returns a service if #results is called first' do
        expect(@facade.service).to be_a(WestFLWXService)
      end
    end
  end
end
