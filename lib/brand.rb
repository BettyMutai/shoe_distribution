class Brand < ActiveRecord::Base
  has_many :shoes
  has_many :stores, through: :shoes

  validates(:name, presence: true)
  before_save(:titlecase_name)

  private
  define_method(:titlecase_name) do
    self.name=(name().titlecase())
  end
end
