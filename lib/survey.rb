class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:survey_name, :presence => true)
  before_save(:capitalize_survey_name)

private

  define_method(:capitalize_survey_name) do
    self.survey_name=(survey_name().capitalize!())
  end

end
