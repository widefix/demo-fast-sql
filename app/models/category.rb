# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: "parent"
  belongs_to :parent, class_name: "Category", optional: true
  has_many :projects
  has_many :services
end
