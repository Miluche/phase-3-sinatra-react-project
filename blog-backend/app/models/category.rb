# frozen_string_literal: true


class Category < ActiveRecord::Base
  has_many :blogs
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
end