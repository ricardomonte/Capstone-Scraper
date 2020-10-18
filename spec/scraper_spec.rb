require_relative '../lib/scraper'

describe Scraper do
  let(:url) { 'https://www.minecraftglobal.com/minecraft-news/' }
  let(:scrap) { Scraper.new(url) }
  describe '#content' do
    it 'return an array' do
      expect(scrap.content).to be_kind_of Array
    end
    it 'will contain info' do
      expect(scrap.content).not_to be_empty
    end
  end
  describe '#complete_content' do
    it 'return an array' do
      expect(scrap.complete_content).to be_kind_of Array
    end
    it 'will contain info' do
      expect(scrap.complete_content).not_to be_empty
    end
  end
end
