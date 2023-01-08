class WestFLWXService
  def querry(email)
		post_url("/api/v1/email?address=#{email}")
	end

	def get_url(url)
		JSON.parse(conn.post(url).body, symbolize_names: true)
	end

	def conn
		Faraday.new(url: 'http://localhost:3000') do |f|
			f.adapter Faraday.default_adapter
		end
	end
end