class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_input = req.path.split("/items/").last
      found_item = @@items.find {|item| item.name == item_input}
      if found_item
        resp.write found_item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"

    end
    resp.finish
  end


end
