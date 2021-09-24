defmodule ChatWeb.PageController do
  use ChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  # see: github.com/dwyl/ping
  def ping(conn, params) do
    Ping.render_pixel(conn, params)
  end

  def categorys(conn, %{"id" => id}) do
    render(conn, "category.html", categoryid: id)
  end

  def detail(conn, %{"id" => id}) do
    render(conn, "detail.html", itemid: id)
  end
end
