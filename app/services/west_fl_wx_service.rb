class WestFLWXService
  # def querry(email)
	# 	get_url("/api/v1/email?address=#{email}")
	# end

  def querry(email)
    # { data: 'No Current Alerts' }
    { data: 'Current Alerts in Your Area' }
  end

	def get_url(url)
		JSON.parse(conn.get(url).body, symbolize_names: true)
	end

	def conn
		Faraday.new(url: 'http://localhost:3000') do |f|
			f.adapter Faraday.default_adapter
		end
	end
end