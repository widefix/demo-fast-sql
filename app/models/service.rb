# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :category
  belongs_to :user
end
