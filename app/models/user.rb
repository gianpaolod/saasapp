class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name:   "Relationship",
                                  foreign_key:  "follower_id",
                                  dependent:    :destroy
  has_many :following, through: :active_relationships, source: :followed
  
  has_many :passive_relationships, class_name:   "Relationship",
                                   foreign_key:  "followed_id",
                                   dependent:    :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  
  belongs_to :plan
  has_one :profile
  
  # Returns a user's status feed.
  def feed
    following_ids_subselect = "SELECT followed_id FROM relationships
                               WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids_subselect}) OR user_id = :user_id", user_id: id).includes(:user)
  end
  
  # Follows a user.
  def follow(other_user)
    following << other_user
    #active_relationships.create(followed_id: other_user.id)
  end
  
  #  Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
    #active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  # Returns true if the current user is following then user.
  def following?(other_user)
    #following.include?(other_user)
    !active_relationships.find_by(followed_id: other_user.id).nil?
  end
  
  attr_accessor :stripe_card_token
  # If pro user passes validations (email, password, etc.).
  # then call Stripe and tell Stripe to set up subscription
  # upon charging the customer's card.
  # Stripe responds back with customer data.
  # Store customer.id as the customer token and save the user.
  def save_with_subscription
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
