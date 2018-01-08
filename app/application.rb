class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path.split('/').last
      if @@items.select {|thing| thing.name == search_term} != []
        item = @@items.select {|thing| thing.name == search_term}
        # item[0].price
        resp.write item
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
