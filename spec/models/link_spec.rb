require 'rails_helper'

describe Link, :type => :model do
  describe 'validations' do
    it 'url' do
      Link.create(title: "First Model Test", url: "http://www.turing.io")
      Link.create(title: "Model test", url: "turing.io")
      expect(Link.count).to eq 1
    end
  end
end
