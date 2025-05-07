class User < ApplicationRecord
  has_many :authored_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy

  has_many :test_results, dependent: :destroy
  has_many :passed_tests, through: :test_results, source: :test

  def passed_tests_by_level(level)
    passed_tests.where(level: level)
  end
end
