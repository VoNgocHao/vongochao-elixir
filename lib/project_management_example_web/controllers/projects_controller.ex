defmodule ProjectManagementExampleWeb.ProjectsController do
  use ProjectManagementExampleWeb, :controller

  alias ProjectManagementExample.Management
  # alias ProjectManagementExample.Management.Projects

  action_fallback ProjectManagementExampleWeb.FallbackController

  def index(conn, _params) do
    url = "https://shopee.vn/api/v4/shop/get_categories?limit=20&offset=0&shopid=88201679"
    {:ok, data} = HTTPoison.get(url)
    json(conn, Poison.decode!(data.body))
  end

  def show(conn, %{"id" => id}) do
    projects = Management.get_projects!(id)
    render(conn, "show.json", projects: projects)
  end
end
