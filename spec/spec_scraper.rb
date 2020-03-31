require 'spec_helper'
require '../lib/scraper'

describe Scraper do
    let(:scraper) {Scraper.new}
    describe "#start" do
        context "when the URL responds successfully" do
            scraper.start
            it "Opens the worldometers website" do
            end
        end
      end
    end
end