require_relative '../lib/create_url'

describe CreateUrl do
  let(:url) { 'https://www.minecraftglobal.com/minecraft-news/' }
  let(:create) { CreateUrl.new }
  describe '#create_url' do
    it 'return a url in a specific position' do
      dbl = double('some scraper', minecraft: [[1, ['a', 'b', 'c', 'd', url]]])
      mine = dbl.minecraft
      expect(create.create_url(1, mine)).to eq(url)
    end
    it 'will not return an element that is not in a specific position' do
      dbl = double('some scraper', minecraft: [[1, ['a', url, 'c', 'd', 'hello world']]])
      mine = dbl.minecraft
      expect(create.create_url(1, mine)).not_to eq(url)
    end
  end
end
