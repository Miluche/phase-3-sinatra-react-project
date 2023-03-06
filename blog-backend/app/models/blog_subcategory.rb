# frozen_string_literal: true

class BlogSubcategory < ActiveRecord::Base
  belongs_to :blog
  belongs_to :subcategory
end