defmodule ProjectManagementExampleWeb.ProductsController do
  use ProjectManagementExampleWeb, :controller

  alias ProjectManagementExample.Management
  # alias ProjectManagementExample.Management.Projects

  action_fallback ProjectManagementExampleWeb.FallbackController

  def index(conn, _params) do
    url = "https://shopee.vn/api/v4/search/search_items?by=pop&limit=30&match_id=88201679&newest=0&order=desc&page_type=shop&scenario=PAGE_OTHERS&version=2"
    {:ok, data} = HTTPoison.get(url)
    json(conn, Poison.decode!(data.body))
  end

  def show(conn, %{"id" => id}) do
    projects = Management.get_projects!(id)
    render(conn, "show.json", projects: projects)
  end
end
