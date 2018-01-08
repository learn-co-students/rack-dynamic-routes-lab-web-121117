class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)#what does this do?
      item_string = req.path.split("/items/").last #splitting items array - giving us the last item as a string
      item = @@items.find{|item_instance|item_instance.name == item_string} #find the item
      if item == nil #if not found return the following
        resp.write "Item not found"
        resp.status = 400
      else #else give us price on item
        resp.write item.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
