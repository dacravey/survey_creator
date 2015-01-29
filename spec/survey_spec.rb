require('spec_helper')

describe(Survey) do
  it { should have_many(:questions) }

  it("capitalizes the title of the survey") do
    survey_name = Survey.create({:survey_name => "survey"})
    expect(survey_name.survey_name()).to eq("Survey")
  end

  it ("validates the presence of a Survey name") do
    survey = Survey.new({:survey_name => ""})
    expect(survey.save()).to(eq(false))
  end
end
