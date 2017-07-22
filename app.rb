require("bundler/setup")
  Bundler.require(:default)
  Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

  get('/') do
    @stores = Store.all()
    erb(:index)
  end

  post('/stores') do
    store = params.fetch("store")
    town = params.fetch("town")
    street = params.fetch("street")
    store = Store.new(name: store, town: town, street: street)
    store.save()
    erb(:index)
  end

  get('/stores/:id') do
    @store = Store.find(params.fetch('id').to_i)
    erb(:store)
  end
