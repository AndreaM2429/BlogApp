class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user.present?
      can :create, Post
      can :delete, Post do |post|
        post.author_id == user.id
      end

      can :create, Comment
      can :delete, Comment do |comment|
        comment.author_id == user.id
      end
    end

    return unless user.role == 'Admin'

    can :manage, :all
  end
end
