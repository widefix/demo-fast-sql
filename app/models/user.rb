# frozen_string_literal: true

class User < ApplicationRecord
  has_many :projects
  has_many :ratings
  has_many :services
end
