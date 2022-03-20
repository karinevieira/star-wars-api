require "rails_helper"

RSpec.describe '/planets', type: :request do
  let(:planet) { create :planet }

  let(:valid_attributes) { attributes_for :planet }
  let(:invalid_attributes) { attributes_for :invalid_planet }

  describe 'GET /index' do
    it 'renders a successful response' do
      get api_planets_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_planets_url(planet), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Planet' do
        expect do
          post api_planets_url,
               params: { planet: valid_attributes },
               as: :json
        end.to change(Planet, :count).by(1)
      end

      it 'renders a JSON response with the new Planet' do
        post  api_planets_url,
              params: { planet: valid_attributes },
              as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Planet' do
        expect do
          post api_planets_url,
               params: { planet: invalid_attributes },
               as: :json
        end.to change(Planet, :count).by(0)
      end

      it 'renders a JSON response with erros for the new planet' do
        post api_planets_url,
             params: { planet: invalid_attributes },
             as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for :planet }

      it 'updates the requested planet' do
        patch api_planet_url(planet),
              params: { planet: new_attributes },
              as: :json
        planet.reload
        expect(planet.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the article' do
        patch api_planet_url(planet),
        params: { planet: new_attributes },
        as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the planet' do
        patch api_planet_url(planet),
              params: { planet: invalid_attributes },
              as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the request planet' do
      planet
      expect do
        delete api_planet_url(planet), as: :json
      end.to change(Planet, :count).by(-1)
    end
  end

end