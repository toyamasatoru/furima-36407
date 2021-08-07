class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, presence: true
  # validates :email, presence: true
  # validates :encrypted_password, presence: true, format:{ with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

  with_options presence: true do
    validates :nickname
    validates :email
    validates :encrypted_password, format:{ with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :family_name 
      validates :first_name
    end
 
     with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana
     end
 end
 
  # validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  # validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  # validates :birthday, presence: true
end
