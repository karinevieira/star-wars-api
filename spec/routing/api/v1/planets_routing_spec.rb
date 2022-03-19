require "rails_helper"

RSpec.describe Api::V1::PlanetsController, type: :routing do
  it { should route(:get, '/api/planets').to(action: :index, format: :json) }
  it { should route(:get, 'api/planets/1').to(action: :show, id: 1, format: :json) }

  it { should route(:post, 'api/planets').to(action: :create, format: :json) }

  it { should route(:put, 'api/planets/1').to(action: :update, id: 1, format: :json) }
  it { should route(:patch, 'api/planets/1').to(action: :update, id: 1, format: :json) }

  it { should route(:delete, 'api/planets/1').to(action: :destroy, id: 1, format: :json) }
end