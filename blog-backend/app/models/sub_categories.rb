# frozen_string_literal: true

class Subcategory < ActiveRecord::Base
  has_many :blog_subcategories
  has_many :blogs, through: :blog_subcategories
end
