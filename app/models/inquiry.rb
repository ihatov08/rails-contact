class Inquiry < ActiveRecord::Base
  attr_accessor :name, :email, :message, :phone, :service, :recruit, :media

  validates :name, :presence => {:message => '名前を入力してください'}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX,:message => 'メールアドレスを正しく入力してください' }

   validates :phone, presence: true, format: { with: /(\b|\D)\(?(0[57-9]0|0\d)([\-\)\(]?\d){5}[\-\)\(]?\d{3}(\b|\D)/,:message => '電話番号を正しく入力して下さい'}

  # validates :phone, :presence => {:message => '電話番号を入力してください'}
end
