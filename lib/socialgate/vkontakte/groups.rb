
module SocialGate
  module Vkontakte
    class Groups

      MAX_GROUPS_IN_LIST = 1000
      FILTER_ADMIN       = 'admin, moder'

      attr_reader :client

      def initialize(client)
        @client ||= VkontakteApi::Client.new(client.token)
      end

      def user_groups(user_id)
        groups(uid: user_id)
      end

      def user_admin_groups(user_id)
        groups(uid: user_id, filter: FILTER_ADMIN)
      end

      private
      def groups(options)
        opt = {
           extended: 1,
           fields:   'members_count',
           count:    MAX_GROUPS_IN_LIST
        }.merge(options)

        groups = client.groups.get(opt)
        groups.shift #remove first element contains count
        groups
      end
    end

  end
end