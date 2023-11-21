class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :question, dependent: :destroy
  has_many :answer, dependent: :destroy
  has_many :bookmark, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10}

  #ゲストログインのための記述
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.name = "ゲストユーザー"
    end
  end

  def active_for_authentication?
    self.is_active == false
  end
  has_one_attached :profile_image
  # 画像がユーザーによって登録されていない場合代替画像を表示する
  # def get_profile_image(width, height)
  #   unless profile_image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   profile_image.variant(resize_to_limit: [width, height]).processed
  # end
end
