# rubocop:disable all
require_relative '../../../bin/main'
describe Main do
    let(:main) { Main.new }
    describe "#get_info" do
        it 'returns the name of the country you give with corona informations' do
            main.scraper.start
            expect(main.scraper.sort_list.compact[0][0]["Country"]).to eql("China")
        end
    end
end