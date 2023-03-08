# frozen_string_literal: true

class Blog  < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
end
