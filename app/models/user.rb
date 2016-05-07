class User < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :teams, through: :participations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, invite_for: 2.weeks

  def self.participate!(team, email_param)
    transaction do
      user = invite!(email_param)
      team.participations.create!(user: user)
    end
  end
end
