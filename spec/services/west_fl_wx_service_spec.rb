require 'rails_helper'
require './app/services/west_fl_wx_service'

# All tests x'ed out untill backend is ready
RSpec.describe WestFLWXService do
  before do
    @service = WestFLWXService.new
  end

  describe 'instance_methods' do
    describe '#querry' do
      xit 'returns a JSON object from API' do
        return_body = @service.querry('email')
        expect(return_body).to be_a(Hash)
        expect(return_body[:data]).to be_a(String)
      end
    end

    describe '#post_url' do
      xit 'returns JSON hash from response body' do
        url = @service.post_url('http://localhost:3000/api/v1/email?address=email')
        expect(url).to be_a(Hash)
      end
    end

    describe 'conn' do
      xit 'connects with api.thing.com' do
        conn = @service.conn
        expect(conn.params).to be_a(Hash)
      end
    end
  end
end
