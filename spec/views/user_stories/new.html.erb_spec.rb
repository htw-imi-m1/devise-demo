require 'rails_helper'

RSpec.describe "user_stories/new", type: :view do
  before(:each) do
    assign(:user_story, UserStory.new(
      :number => "MyString",
      :title => "MyString",
      :description => "MyText",
      :points => "9.99"
    ))
  end

  it "renders new user_story form" do
    render

    assert_select "form[action=?][method=?]", user_stories_path, "post" do

      assert_select "input[name=?]", "user_story[number]"

      assert_select "input[name=?]", "user_story[title]"

      assert_select "textarea[name=?]", "user_story[description]"

      assert_select "input[name=?]", "user_story[points]"
    end
  end
end
