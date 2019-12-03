class User < ApplicationRecord
  # Include default devise modules. Others available are: :timeoutable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :validatable, :trackable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
  enum role: { employee: 0, admin: 1, cs_team: 2, canteen_team: 3, chef: 4 }
  has_many :orders

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :employee
  end

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_initialize
    user.name = auth.info.name unless user.name.present?
    user.password = SecureRandom.hex(6) unless user.encrypted_password.present?
    user.provider = auth.provider unless user.provider.present?
    user.uid = auth.uid unless user.uid.present?
    user.image_url = auth.info.image unless user.image_url.present?
    user.token = auth.credentials.token unless user.token.present?
    user.expires = auth.credentials.expires unless user.expires.present?
    user.expires_at = auth.credentials.expires_at unless user.expires_at.present?
    user.refresh_token = auth.credentials.refresh_token unless user.refresh_token.present?
    user.locale = auth.extra.raw_info.locale unless user.locale.present?
    user.gender = auth.extra.raw_info.gender unless user.gender.present?
    # user.currency = currency_for(auth.locale)
    user.skip_confirmation!
    user.save
    user
  end
end
