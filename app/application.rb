class Application
 
    @@items = []

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path=="/items"
        item = req.path.match("/items/")

        if @@items.include?(item)
           @@items.each { |i| }
            resp.write "added #{new_item}"
         else 
            resp.write "We don't have that item"
         end  
      else
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
end