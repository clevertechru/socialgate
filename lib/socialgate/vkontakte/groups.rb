
module SocialGate
  module Vkontakte
    class Groups

      MAX_GROUPS_IN_LIST = 1000
      FILTER_ADMIN       = 'admin, model'

      attr_reader :client

      def initialize(client)
        @client ||= VkontakteApi::Client.new(client.token)
      end

      def user_groups(user_id)
        @vk_user_groups       = client.groups.get(uid: user_id, extended: 1, fields: 'members_count', count: MAX_GROUPS_IN_LIST)
        @vk_user_groups.shift #remove first element contains count
        @vk_user_groups
      end

      def user_admin_groups(user_id)
        @vk_user_groups       = client.groups.get(uid: user_id, extended: 1, fields: 'members_count', filter: FILTER_ADMIN, count: MAX_GROUPS_IN_LIST)
        @vk_user_groups.shift #remove first element contains count
        @vk_user_groups
      end
    end

  end
end