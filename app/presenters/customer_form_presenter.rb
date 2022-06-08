class CustomerFormPresenter < UserFormPresenter
  def gender_field_block
    markup(:div, class: "radio-buttons") do |m|
      m << decorated_label(:gendeer, "性別")
      m << radio_button(:gender, "male")
      m<< label(:gender_male, "男性")
      m << radio_button(:gender, "female")
      m<< label(:gender_male, "女性")
    end
  end
end
