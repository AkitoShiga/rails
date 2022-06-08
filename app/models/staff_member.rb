class StaffMember < ApplicationRecord
  # StaffMember -> モデルクラスの実装
  # self.table_name = "M_SHOKUIN" ApplicationRecordを継承してtable_nameを独自定義すれば任意のテーブルが使える
  # alias_attribute :section :BUMON M_SHOKUIN.BUMON属性をstaff_member.sectionという属性で定義する事が出来る

  include EmailHolder
  include PersonalNameHolder
  include PasswordHolder# インスタンスに設定しているだけで永続化はしてないんだよね？？？
  end

  has_many :events, class_name: "StaffEvent", dependent: :destroy

  validates :start_date, presence: true, date: {
    after_or_equal_to: Date.new(2000, 1, 1),
    before: ->(obj) { 1.year.from_now.to_date },
    allow_blank: true
  }
  validates :end_date, date: {
    after: :start_date,
    before: -> (obj) { 1.year.from_now.to_date },
    allow_blank: true
  }

  def active?
    !suspended? && start_date <= Date.today &&
      (end_date.nil? || end_date > Date.today)
  end

end
