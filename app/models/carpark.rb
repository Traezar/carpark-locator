# frozen_string_literal: true

class Carpark < ApplicationRecord
  include PgSearch::Model
  include ActiveModel::Serialization
  pg_search_scope :location, against: :address
  has_one :carpark_lot
end
