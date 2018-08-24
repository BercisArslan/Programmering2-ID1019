defmodule DNS do
  @server {8,8,8,8}
  @port 53
  @local 5300

  def start() do
    start(@local,@server,@port)
  end

  def start(local, server, port) do
    spawn(fn -> init(local, server, port) end)
  end

  def init(local,server, port) do

  end
end
