# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  # 同じポケモンに対する重複投票を防ぐ
  validates :pokemon_id, uniqueness: { scope: :user_id, message: 'には既に投票済みです' }

  # 一人3回までの投票制限
  validate :vote_limit

  private

  def vote_limit
    errors.add(:base, '一人3回までの投票に制限されています') if user.votes.count >= 3
  end
end
