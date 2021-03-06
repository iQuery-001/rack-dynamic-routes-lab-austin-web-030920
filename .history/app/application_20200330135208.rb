class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)


        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            
            resp.status = 400 if !item = @@items.find{|i| i.name == item_name}
            # binding.pry
            resp.write item.price
            
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end