get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @event = Event.new
  erb :event_create
end

post '/events/create' do
  @event = Event.new(params)
  if @event.save
    redirect '/'
  else
    p @event.errors.messages
    erb :event_create
  end
end
