class Planet < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :search, ->(name) { where('LOWER(name) LIKE ?', "%#{name.downcase}%") if name.present? }
  scope :sorted_by_name, -> { order(:name) }
end
