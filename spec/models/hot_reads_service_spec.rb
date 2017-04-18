require 'rails_helper'

describe 'HotReadsService' do
  describe '#top_reads' do
    it 'returns json with the urls of the top links' do
      hotreads = HotReadsService.new
      response = hotreads.top_reads
      top_reads = JSON.parse(response.body)
      
      expect(top_reads).to be_an Array
      expect(top_reads[0]).to have_key('url')
    end
  end

  describe '#send_read' do
    it 'returns updated given a url to send' do
      hotreads = HotReadsService.new
      response = hotreads.send_read('http://www.turing.io')
      
      expect(response.status).to be(202)
    end
  end
end