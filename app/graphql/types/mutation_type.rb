module Types
  class MutationType < Types::BaseObject
    field :create_post, mutation: Mutations::Post::Create
    field :create_product, mutation: Mutations::Product::Create
    field :create_inventory, mutation: Mutations::Inventory::Create
    field :create_comment, mutation: Mutations::Comment::Create
    field :create_tenant, mutation: Mutations::Tenant::Create
    field :sign_in_tenant, mutation: Mutations::Tenant::SignIn
    field :update_user, mutation: Mutations::User::Update
  end
end
