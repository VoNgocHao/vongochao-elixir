defmodule ChatWeb.ProductController do
  use ChatWeb, :controller

  def index(conn, _param) do
    # IO.puts id
    url = "https://shopee.vn/api/v4/search/search_items?by=pop&limit=30&match_id=88201679&newest=0&order=desc&page_type=shop&scenario=PAGE_OTHERS&version=2"
    {:ok, data} = HTTPoison.get(url)
    json(conn, data.body)
  end

  # see: github.com/dwyl/ping
  def show(conn, %{"id" => id}) do
    url = "https://shopee.vn/api/v4/item/get?itemid="<> id <>"&shopid=88201679"
    {:ok, data} = HTTPoison.get(url)
    json(conn, data.body)
  end
end
