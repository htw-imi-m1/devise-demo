require 'rails_helper'

RSpec.describe "user_stories/index", type: :view do
  before(:each) do
    assign(:user_stories, [
      UserStory.create!(
        :number => "Number",
        :title => "Title",
        :description => "MyText",
        :points => "9"
      ),
      UserStory.create!(
        :number => "Number",
        :title => "Title",
        :description => "MyText",
        :points => "9"
      )
    ])
  end

  it "renders a list of user_stories" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "9 P.".to_s, :count => 2
  end
end
