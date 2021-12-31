# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  current_user = User.first_or_create(email: 'test@test.com', password: "111111", password_confirmation: '111111' )

  before(:each) do
    assign(:posts, [
             Post.create!(
               title: 'Title ez',
               body: 'MyText',
               user: current_user,
               views: 14
             ),
             Post.create!(
               title: 'Title',
               body: 'MyText body oklm',
               user: current_user,
               views: 12
             )
           ])
  end

  it 'renders a list of posts' do
    render
    # assert_select 'tr>td', text: 'Title'.to_s, count: 2
    # assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Title ez'.to_s, count: 1
    assert_select 'tr>td', text: 'MyText body oklm'.to_s, count: 1
    assert_select 'tr>td', text: current_user.id.to_s, count: 2
    assert_select 'tr>td', text: 12.to_s, count: 1
    assert_select 'tr>td', text: 14.to_s, count: 1
  end
end
