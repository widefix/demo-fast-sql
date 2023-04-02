# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :ratings, dependent: :destroy
  belongs_to :subcategory, class_name: "Category", foreign_key: "category_id", optional: true
  belongs_to :user
  belongs_to :vendor, class_name: "User", foreign_key: "vendor_id", optional: true
end
