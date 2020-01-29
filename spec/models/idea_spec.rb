require 'rails_helper'

RSpec.describe Idea, type: :model do
  context '全ての入力が正常の場合' do
    it '有効であること' do
      idea = build(:idea)
      expect(idea).to be_valid
    end
  end

  it 'タイトルは必須であること' do
    idea = build(:idea)
    idea.title = nil
    idea.valid?
    expect(idea.errors[:title]).to include("を入力してください")
  end
end
