class User < ApplicationRecord
  include ActiveModel::Serialization

  devise :database_authenticatable, :registerable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]


  has_many :lists, dependent: :destroy
  has_many :stars, foreign_key: "starrer_id", dependent: :destroy
  has_many :starred, through: :stars, source: :list
  has_many :items, through: :lists, dependent: :destroy


  validates :name, presence: true, length: { maximum: 50 }

  before_save :downcase_email


  def star(list)
    stars.create(list: list)
  end

  def unstar(list)
    stars.find_by(list_id: list.id).destroy
  end

  def starred?(list)
    starred.include?(list)
  end

  def feed
    feed_ids = "SELECT list_id FROM stars WHERE starrer_id = :user_id"
    List.where("id IN (#{feed_ids}) OR user_id = :user_id", user_id: id)
  end

  def items_by_list(list)
    list.items.where(user_id: self.id)
  end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


  private

  def downcase_email
    self.email = email.downcase
  end
end
