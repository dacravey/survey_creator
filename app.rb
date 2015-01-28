require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @surveys = Survey.all()
  @questions = Question.all()
  erb(:index)
end

post('/survey_list') do
  survey_name = params.fetch("survey_name")
  question = params.fetch("question")
  survey = Survey.create({:survey_name => survey_name})
  question = Question.create({:question => question})
  redirect('/')
end

get('/survey_list/:id') do
  @survey = Survey.find(params.fetch("id").to_i())
  @questions = Question.all()
  erb(:take_survey)
end
