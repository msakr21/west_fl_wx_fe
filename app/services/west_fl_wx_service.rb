class WestFLWXService
  def querry(email)
    post_url("/api/v1/email?address=#{email}")
  end

  def post_url(url)
    JSON.parse(conn.post(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://localhost:5001') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
