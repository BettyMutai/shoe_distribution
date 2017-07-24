class Shoe < ActiveRecord::Base
  belongs_to :brand
  belongs_to :store

  validates(:name, :presence => true)
  before_save(:titlecase_name)

 private
  define_method(:titlecase_name) do
   self.name=(name().titlecase())
 end
end
