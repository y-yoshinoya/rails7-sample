class User < ApplicationRecord
  after_create :generate_otp_secret!

  private

  # user生成後に一意なotp_secretを生成
  def generate_otp_secret!
    self.otp_secret = Digest::SHA1.hexdigest("#{Time.now}-#{self.id}-#{self.updated_at}")
    self.update_columns(otp_secret: otp_secret)
  end
end
