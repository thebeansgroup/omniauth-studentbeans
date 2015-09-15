require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Studentbeans < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site:          'https://www.studentbeans.com',
        authorize_url: '/verge/authorize',
        token_url:     '/oauth/token'
      }

      uid { raw_info['id'] }

      info do
        profile_info = raw_info['profile'] || {}
        student_verification_info = profile_info['student_verification'] || {}

        prune!({
          'email'            => raw_info['email'],
          'first_name'       => profile_info['first_name'],
          'last_name'        => profile_info['last_name'],
          'country'          => profile_info['country'],
          'university'       => student_verification_info['university'],
          'university_email' => student_verification_info['email'],
          'status'           => student_verification_info['status']
        })
      end

      extra do
        hash = {}
        hash['raw_info'] = raw_info unless skip_info?
        prune! hash
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed || {}
      end

      private

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end
