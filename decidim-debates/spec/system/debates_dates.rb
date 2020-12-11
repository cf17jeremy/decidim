# frozen_string_literal: true

require "spec_helper"

describe "Date comprober", versioning: true, type: :system do
  include_context "with a component"
  let(:manifest_name) { "debates" }
  
  let!(:debate) { create(:debate, component: component) }

  before do
    visit_component
    click_link debate.title[I18n.locale.to_s], class: "card__link"
  end

  context "when shows the debate component" do
    it "date same day" do
	    Date.start_time.should be_between(Date.start_time.strftime("%h"),Date.end_time.strftime("%h"))
    end
    	it_behaves_like "going back to list button"
  end
end
