# frozen_string_literal: true

require 'rails_helper'
include PostsHelper

RSpec.describe PostsHelper, type: :helper do
  it 'assign a user to a post' do
    # AAA = Arrange, Act, Assert

    # Arranging data => Assigning variables
    creator = User.first_or_create!(email: 'test@test.com', password: '111111', password_confirmation: '111111')
    @post = Post.new(title: 'MyString', body: 'MyText', views: 1)

    # Act => We're acting with our arranged variables
    returned_post = assign_post_creator(@post, creator)

    # Assert => Assert that our expected outcome matches our actual outcome
    expect(returned_post.user).to be(creator)
  end
end
