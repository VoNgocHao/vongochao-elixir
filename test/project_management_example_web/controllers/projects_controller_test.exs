defmodule ProjectManagementExampleWeb.ProjectsControllerTest do
  use ProjectManagementExampleWeb.ConnCase

  alias ProjectManagementExample.Management
  alias ProjectManagementExample.Management.Projects

  @create_attrs %{
    description: "some description",
    title: "some title"
  }
  @update_attrs %{
    description: "some updated description",
    title: "some updated title"
  }
  @invalid_attrs %{description: nil, title: nil}

  def fixture(:projects) do
    {:ok, projects} = Management.create_projects(@create_attrs)
    projects
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all projects", %{conn: conn} do
      conn = get(conn, Routes.projects_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create projects" do
    test "renders projects when data is valid", %{conn: conn} do
      conn = post(conn, Routes.projects_path(conn, :create), projects: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.projects_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.projects_path(conn, :create), projects: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update projects" do
    setup [:create_projects]

    test "renders projects when data is valid", %{conn: conn, projects: %Projects{id: id} = projects} do
      conn = put(conn, Routes.projects_path(conn, :update, projects), projects: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.projects_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, projects: projects} do
      conn = put(conn, Routes.projects_path(conn, :update, projects), projects: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete projects" do
    setup [:create_projects]

    test "deletes chosen projects", %{conn: conn, projects: projects} do
      conn = delete(conn, Routes.projects_path(conn, :delete, projects))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.projects_path(conn, :show, projects))
      end
    end
  end

  defp create_projects(_) do
    projects = fixture(:projects)
    %{projects: projects}
  end
end
