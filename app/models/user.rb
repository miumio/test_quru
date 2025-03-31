class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('JOIN "test_results" ON "tests"."id" = "test_results"."test_id"')
        .where(level: level)
        .where(test_results: { user_id: self.id })
        .pluck(:title)
    end
end
