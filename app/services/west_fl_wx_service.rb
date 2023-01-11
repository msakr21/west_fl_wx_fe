class WestFLWXService
  def query(email, name)
    post_url("/api/v1/alert_mailer?email=#{email}&name=#{name}")
  end

  def post_url(url)
    JSON.parse(conn.post(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://stormy-harbor-06090.herokuapp.com/') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
