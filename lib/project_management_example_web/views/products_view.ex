defmodule ProjectManagementExampleWeb.ProductsView do
  use ProjectManagementExampleWeb, :view
  alias ProjectManagementExampleWeb.ProjectsView

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, ProjectsView, "projects.json")}
  end

  def render("show.json", %{projects: projects}) do
    %{data: render_one(projects, ProjectsView, "projects.json")}
  end

  def render("projects.json", %{projects: projects}) do
    %{id: projects.id,
      title: projects.title,
      description: projects.description}
  end
end
