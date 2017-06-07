require 'rails_helper'

RSpec.describe "user_stories/edit", type: :view do
  before(:each) do
    @user_story = assign(:user_story, UserStory.create!(
      :number => "MyString",
      :title => "MyString",
      :description => "MyText",
      :points => "9.99"
    ))
  end

  it "renders the edit user_story form" do
    render

    assert_select "form[action=?][method=?]", user_story_path(@user_story), "post" do

      assert_select "input[name=?]", "user_story[number]"

      assert_select "input[name=?]", "user_story[title]"

      assert_select "textarea[name=?]", "user_story[description]"

      assert_select "input[name=?]", "user_story[points]"
    end
  end
end
