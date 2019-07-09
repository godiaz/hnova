class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :designs, dependent: :destroy
  has_one_attached :image
  after_create :subscribe_to_mailist


  def subscribe_to_mailist
    if subscribe
      gibbon = Gibbon::Request.new
      body = { email_address: email, status: 'subscribed' }
      begin
        gibbon.lists('f28827281f').members.create(body: body)
      rescue Gibbon::MailChimpError => e
        case e.title
        when 'Member Exists'
        else
        end
      end
    end
    # raise
  end
end
