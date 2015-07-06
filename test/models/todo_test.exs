defmodule TodoMvc.TodoTest do
  use TodoMvc.ModelCase

  alias TodoMvc.Todo

  @valid_attrs %{completed: %{day: 17, hour: 14, min: 0, month: 4, year: 2010}, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Todo.changeset(%Todo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Todo.changeset(%Todo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
