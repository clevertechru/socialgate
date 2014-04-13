require 'socialgate/vkontakte/groups'
require 'socialgate/resolver'

module SocialGate
  module Vkontakte
    class Client
      include Resolver

      GATE_NAME = 'vkontakte'

      # An access token needed by authorized requests.
      # @return [String]
      attr_reader :token

      # Current user id.
      # @return [Integer]
      attr_reader :user_id

      # Current user email.
      # @return [String]
      attr_reader :email

      # Token expiration time
      # @return [Time]
      attr_reader :expires_at

      attr_reader :client
      attr_reader :type
      attr_reader :gate_name

      # A new API client.
      # If given an `OAuth2::AccessToken` instance, it extracts and keeps
      # the token string, the user id and the expiration time;
      # otherwise it just stores the given token.
      # @param [String, OAuth2::AccessToken] token An access token.
      def initialize(token = nil)
        if token.respond_to?(:token) && token.respond_to?(:params)
          # token is an OAuth2::AccessToken
          @token      = token.token
          @user_id    = token.params['user_id']
          @email      = token.params['email']
          @expires_at = Time.at(token.expires_at) unless token.expires_at.nil?
        else
          # token is a String or nil
          @token = token
        end
        @client    = VkontakteApi::Client.new(@token)
        @type      = self
        @gate_name = GATE_NAME
      end

      def groups
        SocialGate::Vkontakte::Groups.new(@client)
      end

    end
  end
end