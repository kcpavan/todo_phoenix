defmodule TodoMvc.TodoController do
  use TodoMvc.Web, :controller

  alias TodoMvc.Todo

  plug :scrub_params, "todo" when action in [:create, :update]

  def index(conn, _params) do
    todos = Repo.all(Todo)
    render(conn, "index.html", todos: todos)
  end

  def new(conn, _params) do
    changeset = Todo.changeset(%Todo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"todo" => todo_params}) do
    changeset = Todo.changeset(%Todo{}, todo_params)

    if changeset.valid? do
      Repo.insert!(changeset)

      conn
      |> put_flash(:info, "Todo created successfully.")
      |> redirect(to: todo_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)
    render(conn, "show.html", todo: todo)
  end

  def edit(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)
    changeset = Todo.changeset(todo)
    render(conn, "edit.html", todo: todo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = Repo.get!(Todo, id)
    changeset = Todo.changeset(todo, todo_params)

    if changeset.valid? do
      Repo.update!(changeset)

      conn
      |> put_flash(:info, "Todo updated successfully.")
      |> redirect(to: todo_path(conn, :index))
    else
      render(conn, "edit.html", todo: todo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)
    Repo.delete!(todo)

    conn
    |> put_flash(:info, "Todo deleted successfully.")
    |> redirect(to: todo_path(conn, :index))
  end
end
