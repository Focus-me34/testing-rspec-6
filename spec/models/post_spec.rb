# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create(email: 'test@test.com')

  it "has a title attached to a user's post" do
    post = Post.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.title = 'Has a title'
    expect(post).to be_valid

    # post.
  end

  it 'has a body' do
    post = Post.new(
      title: 'A valid title',
      body: '',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = 'This is a valid body now'
    expect(post).to be_valid
  end

  it 'has a title at least 2 characters long' do
    post = Post.new(
      title: 'T',
      body: 'This is a valid body now',
      user: current_user,
      views: 0
    )

    title_length = post.title.length
    expect(title_length).to_not be >= 2

    post.title = 'Title'
    title_length = post.title.length
    expect(title_length).to be >= 2
  end

  it 'has a body between 5 and 100 characters' do
    post = Post.new(
      title: 'Title',
      body: 'Body', # 4 characters here !
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid

    post.body = 'Valid body'
    expect(post).to be_valid

    post.body = '500 + CHARACTERS lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll'
    expect(post).to_not be_valid

    post.body = 'LESS THAN 500 CHARACTERS lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll'
    expect(post).to be_valid

    expect(post.body.length).to be_between(5, 500).inclusive

  end

  it 'has numerical views' do
  post = Post.new(
    title: 'Title',
    body: 'Valid body',
    user: current_user,
    views: 0.5
  )
  expect(post).to_not be_valid

  post.views = 1
  expect(post).to be_valid
  end
end
