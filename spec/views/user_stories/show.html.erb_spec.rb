require 'rails_helper'

RSpec.describe "user_stories/show", type: :view do
  before(:each) do
    @user_story = assign(:user_story, UserStory.create!(
      :number => "Number",
      :title => "Title",
      :description => "MyText",
      :points => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
  end
end
