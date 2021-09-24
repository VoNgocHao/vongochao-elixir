defmodule ChatWeb.CategoryContronller do
  use ChatWeb, :controller

  def index(conn, _params) do
    url = "https://shopee.vn/api/v4/shop/get_categories?limit=20&offset=0&shopid=88201679"
    {:ok, data} = HTTPoison.get(url)
    json(conn, data.body)
  end

  # see: github.com/dwyl/ping
  def show(conn, %{"id" => id}) do
    url = "https://shopee.vn/api/v4/search/search_items?by=pop&limit=30&match_id=88201679&newest=0&order=desc&page_type=shop&scenario=PAGE_OTHERS&shop_categoryids=" <> id <>"&version=2"
    {:ok, data} = HTTPoison.get(url)
    json(conn, data.body)
  end
end
