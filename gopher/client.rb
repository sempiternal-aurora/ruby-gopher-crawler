=begin
Module      : Gopher Client
Description : TODO
Maintainer  : u7644255@anu.edu.au

TODO
=end

require 'socket'

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

    def get(resource)
        self.open_socket
        @socket.print("#{resource}\r\n")
        response = @socket.read
        self.close_socket
        return response
    end

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

