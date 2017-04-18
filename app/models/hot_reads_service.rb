require 'faraday'
class HotReadsService
  def initialize
    @conn = Faraday.new(:url => 'https://agile-ocean-54614.herokuapp.com')
  end

  def send_read(url)
    @conn.post do |req|
      req.url '/'
      req.headers['Content-Type'] = 'application/json'
      req.body = {"url": url}.to_json
    end
  end
  
  def top_reads
    @conn.get do |req|
      req.url '/api/v1/top_reads'
    end
  end
end