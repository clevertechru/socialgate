
module SocialGate
  module Odnoklassniki

    class Groups

      attr_reader :client

      def initialize(application_secret_key, application_key, token)
        @client ||= SocialGate::Odnoklassniki::API.new(
            application_secret_key,
            application_key,
            token)
      end

      def groups
        @client.get({method: 'group.getUserGroupsV2'})
      end

      def group(uid)
        @client.get({method: 'group.getInfo', uids: uid, fields: 'uid,name,members_count'})
      end

    end

  end
end