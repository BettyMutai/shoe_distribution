require("bundler/setup")
  Bundler.require(:default)
  Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

  get('/') do
    @stores = Store.all()
    @brands = Brand.all()
    erb(:index)
  end

  post('/stores') do
    store = params.fetch("store")
    town = params.fetch("town")
    street = params.fetch("street")
    image = params.fetch("image")
    size = params.fetch("size")
    cost = params.fetch("cost")
    brand = Brand.find(params.fetch("brand_id").to_i)
    store = Store.new(name: store, town: town, street: street)
    if store.save()
      shoe = Shoe.new(image: image, size: size, cost: cost, brand_id: brand.id, store_id: store.id)
      shoe.save()
      redirect('/stores/'.concat(store.id.to_s))
    else
    erb(:index)
    end
  end

  get('/stores/:id') do
    @store = Store.find(params.fetch('id').to_i)
    erb(:store)
  end

  patch('/stores/:id') do
    @store = Store.find(params.fetch("id").to_i)
    @store.update(name: params.fetch("store"), town: params.fetch("town"), street: params.fetch("street"))
    image = params.fetch("image")
    size = params.fetch("size")
    cost = params.fetch("cost")
    shoe = Shoe.find_by_store_id(params.fetch("id").to_i)
    shoe.update(image: image, size: size, cost: cost)
    erb(:store)
  end

  delete('/stores/:id') do
    @store = Store.find(params.fetch("id").to_i)
    @shoe = Shoe.find_by_store_id(params.fetch("id").to_i)
    @shoe.destroy
    @store.destroy
    redirect("/")
  end

  post('/brands') do
    brand = Brand.new(name: params.fetch("brand"))
    if brand.save()
      redirect('/brands/'.concat(brand.id.to_s))
    else
    erb(:index)
    end
  end

  get('/brands/:id') do
    @brand = Brand.find(params.fetch("id").to_i)
    erb(:brand)
  end
