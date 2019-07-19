# frozen_string_literal: true

require 'spec_helper'

describe OmniAuth::Strategies::Gusto do
  subject do
    described_class.new({})
  end

  describe 'production client options' do
    it { expect(subject.options.name).to eq('gusto') }
    it { expect(subject.options.client_options.site).to eq('https://api.gusto.com/') }
    it { expect(subject.options.client_options.authorize_url).to eq('/oauth/authorize') }
    it { expect(subject.options.client_options.token_url).to eq('/oauth/token') }
  end

  describe 'callback phase instance methods' do
    let(:uid) { 123 }
    let(:email) { 'blah@blah.com' }
    let(:response_params) do
      {
        'id' => uid,
        'email' => email
      }
    end
    let(:access_token) { instance_double('AccessToken') }
    let(:oauth2_response) { instance_double('Oauth2::Response', parsed: response_params) }

    before do
      allow(subject).to receive(:access_token).and_return(access_token)
      allow(access_token).to receive(:get).with('/v1/me').and_return(oauth2_response)
    end

    describe 'response hash' do
      it 'returns fields from the response hash' do
        expect(subject.uid).to eq(uid)
        expect(subject.info['email']).to eq(email)
      end
    end
  end
end
