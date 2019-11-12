class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      existing_item = @@items.find { |i| i.name == item_name }
      if existing_item.nil?
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write existing_item.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
