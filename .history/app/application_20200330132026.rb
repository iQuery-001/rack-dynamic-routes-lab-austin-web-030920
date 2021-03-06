class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        @@items = []

        if req.path.match(/items/)
            item_name = req.path.split("/items").last

            item = @@items.find{|i| i.name == item_name}
            resp.write item.item_price
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end