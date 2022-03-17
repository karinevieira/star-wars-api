class PlanetSerializer < ActiveModel::Serializer
  attributes :id, :name, :weather, :ground
end
