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
  survey = Survey.create({:survey_name => survey_name})
  question = Question.create({:question => question, :survey_id => survey.id})
  redirect('/')
end

get('/survey_list/:id') do
  @survey = Survey.find(params.fetch("id").to_i())
  @questions = Question.all()
  erb(:take_survey)
end

post('/survey_list/:id') do
  question = params.fetch('question')
  survey_id = params.fetch('survey_id').to_i()
  @survey = Survey.find(survey_id)
  @question = Question.create({:question => question, :survey_id => survey_id})
  erb(:take_survey)
end

delete('/survey_delete/:id') do
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.delete()
  @surveys = Survey.all()
  erb(:index)
end

patch('/survey_edit/:id') do
  @survey = Survey.find(params.fetch("id").to_i())
  survey_name = params.fetch("survey_name")
  @survey.update({:survey_name => survey_name})
  @surveys = Survey.all()
  erb(:index)
end
