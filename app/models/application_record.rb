class ApplicationRecord < ActiveRecord::Base
  # ActiveRecord      -> モデルクラスの規定
  # ApplicationRecord -> モデルクラスの抽象
  self.abstract_class = true
end
