require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

post('/survey_list') do
  question = params.fetch("question")
  survey = Survey.create({:question => question})
  redirect('/')
end
