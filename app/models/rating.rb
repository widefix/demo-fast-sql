# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :project
  belongs_to :reviewee, class_name: "User", foreign_key: "reviewee_id"
  belongs_to :reviewer, class_name: "User", foreign_key: "reviewer_id"
end
