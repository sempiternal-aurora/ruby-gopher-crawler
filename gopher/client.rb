=begin
Module      : Gopher Client
Description : TODO
Maintainer  : u7644255@anu.edu.au

TODO
=end

require 'socket'

# A class defining all information relating to a gopher server
# including methods to interact and retrieve resources from it
class Gopher_Server
    def initialize(host, port)
        @host = host
        @port = port
    end

    def open_socket()
        @socket = TCPSocket.open(@host, @port)
    end

    def close_socket()
        @socket.close()
    end

    # Given a resource location on the main server, connect to the
    # Server and retrieve the resource
    def get(resource)
        self.open_socket
        @socket.print("#{resource}\r\n")
        response = @socket.read
        self.close_socket
        return response
    end

    # TODO: Implement resource parsing, datatype and more
    def parse_response(response)
        arr_response = response.split("\r\n")

        final_arr_response = []
        arr_response.each do |line|
            final_arr_response.append(line.split("\t"))
        end
        return final_arr_response
    end
end

server = Gopher_Server.new("comp3310.ddns.net", 70)
response = server.get("/misc/nonexistent")
print response

