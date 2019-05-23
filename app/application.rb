class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      item = req.path.split("/items/").last
      item_search = @@items.find{|i| i.name == item}
      if item_search == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write item_search.price
        resp.status = 200
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

      resp.finish
  end

end
