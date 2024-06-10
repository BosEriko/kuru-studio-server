module Queries
  # Base Queries class
  class BaseQuery < GraphQL::Schema::Resolver
    private

    def check_admin!
      check_authentication!(context[:current_admin], 'You need to an admin to perform this action')
    end

    def check_authentication!
      check_authentication!(context[:current_user], 'You need to authenticate to perform this action')
    end

    def check_tenant!
      check_authentication!(context[:current_tenant], 'You need to have a tenant to perform this action')
    end

    def check_authentication!(condition, error_message)
      raise GraphQL::ExecutionError, error_message unless condition
    end
  end
end
