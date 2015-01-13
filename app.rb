require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')

get('/') do
  erb(:index)
end

post('/new') do
  name = params.fetch('name')
  @pet = Tamagotchi.new(name)
  erb(:care)
end

post('/food') do
  @pet.food()
  erb(:care)
end

post('/sleep') do
  @pet.sleep()
  erb(:care)
end

post('/activity') do
  @pet.activity()
  erb(:care)
end

post('/check') do
  @pet.time_passes()
  @pet.sleep_level()
  @pet.food_level()
  @pet.activity_level()
  erb(:check)
end

 #
 # delete('/post') do
 #   @task = Task.find(3)
 #   @task.destroy()
 # end
