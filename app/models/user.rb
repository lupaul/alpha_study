class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]


  before_create :generate_authentication_token

  has_one :school, dependent: :destroy
  has_one :photo
  accepts_nested_attributes_for :photo
  has_many :activities
  has_many :participations
  has_many :activityships, through: :participations, source: :activity
  has_many :liked_topics, through: :likes, source: :topic
  has_many :reservations
  has_many :participated_activity, through: :participations, source: :activity
  has_many :reservations
  has_many :appointments
  has_many :participated_reservation, through: :appointments, source: :reservation
  has_many :consultations

  def is_member_of?(reservation)
    participated_reservation.include?(reservation)
  end

  def generate_authentication_token
     self.authentication_token = Devise.friendly_token
     self.role = "student"
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :google_uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          google_uid: access_token.uid ,
          password: Devise.friendly_token[0,20]
        )
      end
    end
  end


  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
       user.fb_token = auth.credentials.token
       #user.fb_raw_data = auth
       user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      #existing_user.fb_raw_data = auth
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    #user.fb_raw_data = auth
    user.save!
    return user
  end
end
