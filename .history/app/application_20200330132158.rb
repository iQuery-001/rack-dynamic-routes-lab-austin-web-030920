class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        @@items = []

        if req.path.match(/items/)
            item_name = req.path.split("/items").last

            item = @@items.find{|i| i[0] == item_name}
            resp.write item[1]]
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end