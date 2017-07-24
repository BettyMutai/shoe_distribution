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
    store = Store.new(name: store, town: town, street: street)
    if store.save()
      redirect('/stores/'.concat(store.id.to_s))
    else
    erb(:index)
    end
  end

  get('/stores/:id') do
    @brands = Brand.all
    @shoes = Shoe.all
    @store = Store.find(params.fetch('id').to_i)
    erb(:store)
  end

  patch('/stores/:id') do
    @store = Store.find(params.fetch("id").to_i)
    @store.update(name: params.fetch("store"), town: params.fetch("town"), street: params.fetch("street"))
    redirect('/stores/'.concat(@store.id.to_s))
  end

  delete('/stores/:id') do
    @shoes = Shoe.find_by_store_id(params.fetch("id").to_i)
    @shoes.destroy
    @store = Store.find(params.fetch("id").to_i)
    @store.destroy
    redirect("/")
  end

  post('/shoes') do
    store = Store.find(params.fetch("id").to_i)
    brand = Brand.find(params.fetch("brand_id").to_i)
    shoe = Shoe.new(image: params.fetch("image"), size: params.fetch("size"), cost: params.fetch("cost"), store_id: store.id, brand_id: brand.id)
    if shoe.save()
      redirect('/stores/'.concat(store.id.to_s))
    else
    erb(:index)
    end
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

  patch('/brands/:id') do
    @brand = Brand.find(params.fetch("id").to_i)
    @brand.update(name: params.fetch("brand"))
    erb(:brand)
  end

  delete('/brands/:id') do
    @brand = Brand.find(params.fetch("id").to_i)
    @brand.destroy
    redirect("/")
  end
