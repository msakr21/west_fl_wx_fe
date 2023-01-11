require 'rails_helper'
require './app/services/west_fl_wx_service'

# All tests x'ed out until backend is ready
RSpec.describe WestFLWXService do
  before do
    @service = WestFLWXService.new
  end

  describe 'instance_methods' do
    describe '#query' do
      it 'returns a JSON object from API', :vcr do
        return_body = @service.query('email','name')
        expect(return_body).to be_a(Hash)
        expect(return_body[:data]).to be_a(String)
      end
    end

    describe '#post_url' do
      it 'returns JSON hash from response body', :vcr do
        url = @service.post_url('/api/v1/alert_mailer?email=email&name=Bill')
        expect(url).to be_a(Hash)
      end
    end

    describe 'conn' do
      it 'connects with api.thing.com', :vcr do
        conn = @service.conn
        expect(conn.params).to be_a(Hash)
      end
    end
  end
end
