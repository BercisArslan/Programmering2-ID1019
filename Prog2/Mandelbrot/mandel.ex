defmodule Mandel do

  def mandelbrot(width,height,x,y,k,depth) do
    trans = fn(w, h) ->
      Cmplx.new(x + k * (w - 1), y - k * (h - 1))
    end
    rows(width, height, trans, depth, [])
  end

  # list = [[alla färger på rad 1],[alla färger på rad 2], [alla färger på rad 3]....]

  # hanterar höjden, när en vågrät rad är klar hoppar den till nästa lodräta rad
  def rows(width,0,trans,depth,list) do
    list
  end
  def rows(width,height,trans,depth,list) do
    totlist = [(rowsw(width,height,trans,depth,[]))|list]
    rows(width,height-1,trans,depth,totlist)
  end

  #hanterar bara de vågräta raderna
  def rowsw(0,height,trans,depth,sublist) do
    sublist
  end
  def rowsw(width,height,trans,depth,sublist) do
    c = trans.(width,height)
    i = Brot.mandelbrot(c,depth)
    color = Color.convert(i,depth)
    rowsw((width - 1),height,trans,depth,[color|sublist])
  end

  def demo() do
    small(-2.6, 1.2, 1.2)
  end
  def small(x0, y0, xn) do
    width = 960
    height = 540
    depth = 50
    k = (xn - x0) / width
    image = Mandel.mandelbrot(width, height, x0, y0, k, depth)
    PPM.write("small.ppm", image)
  end
end
