class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user, class_name: "User", foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :test_results, dependent: :destroy
  has_many :passed_tests, through: :test_results, source: :user

  def self.category_titles_desc(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(created_at: :desc)
      .pluck(:title)
  end
end
