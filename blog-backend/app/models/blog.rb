# frozen_string_literal: true

class Blog < ActiveRecord::Base
  belongs_to :author
  has_many :blog_subcategories
  has_many :subcategories, through: :blog_subcategories
end
