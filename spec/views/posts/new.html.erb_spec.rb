# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/new', type: :view do
  current_user = User.first_or_create!(email: 'test@test.com', password: '111111', password_confirmation: '111111' )

  before(:each) do
    assign(:post, Post.new(
                    title: 'MyString',
                    body: 'MyText',
                    user: current_user,
                    views: 0
                  ))
  end

  it 'renders new post form' do
    render

    assert_select 'form[action=?][method=?]', posts_path, 'post' do
      assert_select 'input[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[body]'
    end
  end
end
