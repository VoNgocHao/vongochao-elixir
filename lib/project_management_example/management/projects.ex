defmodule ProjectManagementExample.Management.Projects do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(projects, attrs) do
    projects
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
