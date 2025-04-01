class Test < ApplicationRecord
  def self.desc_list_by_category(category_title)
    joins('JOIN "categories" ON "tests"."category_id" = "categories"."id"')
        .where(categories: { title: category_title })
        .order(created_at: :desc)
        .pluck(:title)
  end
end
