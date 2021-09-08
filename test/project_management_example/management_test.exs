defmodule ProjectManagementExample.ManagementTest do
  use ProjectManagementExample.DataCase

  alias ProjectManagementExample.Management

  describe "projects" do
    alias ProjectManagementExample.Management.Projects

    @valid_attrs %{description: "some description", title: "some title"}
    @update_attrs %{description: "some updated description", title: "some updated title"}
    @invalid_attrs %{description: nil, title: nil}

    def projects_fixture(attrs \\ %{}) do
      {:ok, projects} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_projects()

      projects
    end

    test "list_projects/0 returns all projects" do
      projects = projects_fixture()
      assert Management.list_projects() == [projects]
    end

    test "get_projects!/1 returns the projects with given id" do
      projects = projects_fixture()
      assert Management.get_projects!(projects.id) == projects
    end

    test "create_projects/1 with valid data creates a projects" do
      assert {:ok, %Projects{} = projects} = Management.create_projects(@valid_attrs)
      assert projects.description == "some description"
      assert projects.title == "some title"
    end

    test "create_projects/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_projects(@invalid_attrs)
    end

    test "update_projects/2 with valid data updates the projects" do
      projects = projects_fixture()
      assert {:ok, %Projects{} = projects} = Management.update_projects(projects, @update_attrs)
      assert projects.description == "some updated description"
      assert projects.title == "some updated title"
    end

    test "update_projects/2 with invalid data returns error changeset" do
      projects = projects_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_projects(projects, @invalid_attrs)
      assert projects == Management.get_projects!(projects.id)
    end

    test "delete_projects/1 deletes the projects" do
      projects = projects_fixture()
      assert {:ok, %Projects{}} = Management.delete_projects(projects)
      assert_raise Ecto.NoResultsError, fn -> Management.get_projects!(projects.id) end
    end

    test "change_projects/1 returns a projects changeset" do
      projects = projects_fixture()
      assert %Ecto.Changeset{} = Management.change_projects(projects)
    end
  end
end
