defmodule ProjectManagementExample.Management do
  @moduledoc """
  The Management context.
  """

  import Ecto.Query, warn: false
  alias ProjectManagementExample.Repo

  alias ProjectManagementExample.Management.Projects

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Projects{}, ...]

  """
  def list_projects do
    Repo.all(Projects)
  end

  @doc """
  Gets a single projects.

  Raises `Ecto.NoResultsError` if the Projects does not exist.

  ## Examples

      iex> get_projects!(123)
      %Projects{}

      iex> get_projects!(456)
      ** (Ecto.NoResultsError)

  """
  def get_projects!(id), do: Repo.get!(Projects, id)

  @doc """
  Creates a projects.

  ## Examples

      iex> create_projects(%{field: value})
      {:ok, %Projects{}}

      iex> create_projects(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_projects(attrs \\ %{}) do
    %Projects{}
    |> Projects.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a projects.

  ## Examples

      iex> update_projects(projects, %{field: new_value})
      {:ok, %Projects{}}

      iex> update_projects(projects, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_projects(%Projects{} = projects, attrs) do
    projects
    |> Projects.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a projects.

  ## Examples

      iex> delete_projects(projects)
      {:ok, %Projects{}}

      iex> delete_projects(projects)
      {:error, %Ecto.Changeset{}}

  """
  def delete_projects(%Projects{} = projects) do
    Repo.delete(projects)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking projects changes.

  ## Examples

      iex> change_projects(projects)
      %Ecto.Changeset{data: %Projects{}}

  """
  def change_projects(%Projects{} = projects, attrs \\ %{}) do
    Projects.changeset(projects, attrs)
  end
end
