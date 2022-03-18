class Planet < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :search, ->(name) { where('LOWER(name) LIKE ?', "%#{name.downcase}%") if name.present? }
  scope :sorted_by_name, -> { order(:name) }

  def get_films
    name = self.name

    response = RestClient.get "https://swapi.dev/api/planets/?search=#{name}"

    results = JSON.parse response
    results = results['results'].first

    if results.present?
      films = results['films']
    else
      films = ['no movies found']
    end

    films
  end
end
