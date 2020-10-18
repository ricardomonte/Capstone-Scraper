require_relative '../lib/scraper'

describe Scraper do
  let(:url){'https://www.minecraftglobal.com/minecraft-news/'}
  let(:a) {Scraper.new(url).content}
  describe "#content" do
    it 'return an array' do
      expect(a).to be_kind_of Array
    end
    it 'will contain info' do
      expect(a).not_to be_empty
    end
  end
end