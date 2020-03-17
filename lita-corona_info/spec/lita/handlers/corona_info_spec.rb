require "spec_helper"

describe Lita::Handlers::CoronaInfo, lita_handler: true do
    context "when we write hello" do
        it{ is_expected.to route("hello").to(:hellowrod) }
        it{ is_expected.not_to route("morning").to(:hellowrod) }
    end
end
