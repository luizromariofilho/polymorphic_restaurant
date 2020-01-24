require 'rails_helper'

RSpec.describe 'Restaurants', type: :request do
	let!(:restaurant) { create(:restaurant) }
	let(:restaurant_id) { restaurant.id }
	let(:headers) do
	  {
	  	# 'Accept' => 'application/vnd.zssn.v1',
	    'Content-Type' => Mime[:json].to_s
	  }
  end

  before { host! 'localhost:3000'}

	describe 'GET /restaurants' do 

		context 'when exists list of restaurants' do
			
			it 'return list of restaurants in json' do 
	      get "/restaurants.json", headers: headers
				expect(response.content_type).to eq("application/json")
				expect(response).to have_http_status(:ok)
			end

			it 'return view of restaurants' do
	      get "/restaurants", headers: headers
		    expect(response.content_type).to eq("text/html")
				expect(response).to have_http_status(:ok)
		  end
		end
  end

	describe 'GET /restaurants/:id' do

    context 'when the restaurant exists' do

      it 'returns the restaurant' do
  			get "/restaurants/#{restaurant_id}.json", headers: headers
        expect(json_body[:id]).to eq(restaurant_id) 
      end

      it 'returns status code :ok' do
  			get "/restaurants/#{restaurant_id}.json", headers: headers
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the restaurant not exist' do

      let(:restaurant_id) { -1 }

      it 'return status code :not_found' do
  			get "/restaurants/#{restaurant_id}.json", headers: headers
        expect(response).to have_http_status(:not_found)
      end
		end
	end

  describe 'POST /restaurants' do 
    before do  
      post '/restaurants', params: { restaurant: restaurant_params }.to_json, headers: headers
    end

    context 'when the request params are valid' do
      let(:restaurant_params) { attributes_for(:restaurant) }
      
      it 'returns status code :created' do
        expect(response).to have_http_status(:created)
      end

      it 'returns json data for the created restaurant' do
        expect(json_body[:name]).to eq(restaurant_params[:name])
      end
    end

    context 'when the request params are invalid' do
      let(:restaurant_params) { attributes_for(:restaurant, name: '')}

      it 'returns status code :unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'return the json data for the errors' do
        expect(json_body).to have_key(:errors)
      end
    end
  end
end