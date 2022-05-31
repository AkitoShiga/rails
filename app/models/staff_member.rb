class StaffMember < ApplicationRecord
  # StaffMember -> モデルクラスの実装
  # self.table_name = "M_SHOKUIN" ApplicationRecordを継承してtable_nameを独自定義すれば任意のテーブルが使える
  # alias_attribute :section :BUMON M_SHOKUIN.BUMON属性をstaff_member.sectionという属性で定義する事が出来る

  has_many :events, class_name: "StaffEvent", dependent: :destroy
  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
    # インスタンスに設定しているだけで永続化はしてないんだよね？？？
  end

  def active?
    !suspended? && start_date <= Date.today &&
      (end_date.nil? || end_date > Date.today)
  end

end
