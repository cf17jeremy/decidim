# frozen_string_literal: true

require "spec_helper"

describe "Debate dates", versioning: true, type: :system do
  include_context "with a component"
  let(:manifest_name) { "debates" }

  let!(:debate) { create(:debate, component: component, start_time: start_time, end_time: end_time) }
  let(:start_time) { Time.current - 1.hour }
  let(:end_time) { Time.current }

  before do
    visit_component
    click_link debate.title[I18n.locale.to_s], class: "card__link"
  end

  context "when starting and ending on same day" do
    it "shows one day only" do
      within ".extra__date" do
        expect(page).to have_content(start_time.strftime("%h"))
      end
    end

    it "shows two hours" do
    end
  end

  context "when starting and ending same day but different month" do
    it "shows two days" do
    end

    it "shows two hours" do
    end
  end
end
