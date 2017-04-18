require 'faraday'
class HotReadsService
  def initialize(url = '')
    @conn = Faraday.new(:url => 'https://agile-ocean-54614.herokuapp.com')
    @url = url
  end

  def send_read
    @conn.post do |req|
      req.url '/'
      req.headers['Content-Type'] = 'application/json'
      req.body = {"url": @url}.to_json
    end
  end
  
  def top_reads
    @conn.get do |req|
      req.url '/api/v1/top_reads'
    end
  end
end