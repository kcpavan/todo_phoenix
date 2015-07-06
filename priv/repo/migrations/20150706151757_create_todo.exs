defmodule TodoMvc.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :title, :string
      add :completed, :datetime

      timestamps
    end

  end
end
