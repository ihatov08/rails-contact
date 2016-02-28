class Inquiry < ActiveRecord::Base
  attr_accessor :name, :email, :phone, :service, :recruit, :media, :message


  validates :name, :presence => {:message => '名前を入力してください'}

  validates :email, :presence => {:message => 'メールアドレスを入力してください'}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX,:message => 'メールアドレスを正しく入力してください' }


  validates :phone, :presence => {:message => '電話番号を入力して下さい'}
  validates :phone, format: { with: /(\b|\D)\(?(0[57-9]0|0\d)([\-\)\(]?\d){5}[\-\)\(]?\d{3}(\b|\D)/,:message => '電話番号を正しく入力して下さい'}

  # validates :service, :acceptance => {:message => 'チェックしてください'}

  validate :check_box

  def check_box
    if service.nil? && recruit.nil? && media.nil?
        errors.add(:service, "入力してください")
    end
  end




  validates :message, :presence => {:message => 'お問い合わせ内容を入力してください'}

  # validates :like, present_like: true
end
