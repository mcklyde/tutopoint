defmodule TutopointWeb.GuideController do
  use TutopointWeb, :controller

  alias Tutopoint.Users
  alias Tutopoint.Users.Guide

  def index(conn, _params) do
    guides = Users.list_guides()
    render(conn, "index.html", guides: guides)
  end

  def new(conn, _params) do
    changeset = Users.change_guide(%Guide{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"guide" => guide_params}) do
    case Users.create_guide(guide_params) do
      {:ok, guide} ->
        conn
        |> put_flash(:info, "Guide created successfully.")
        |> redirect(to: Routes.guide_path(conn, :show, guide))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    guide = Users.get_guide!(id)
    render(conn, "show.html", guide: guide)
  end

  def edit(conn, %{"id" => id}) do
    guide = Users.get_guide!(id)
    changeset = Users.change_guide(guide)
    render(conn, "edit.html", guide: guide, changeset: changeset)
  end

  def update(conn, %{"id" => id, "guide" => guide_params}) do
    guide = Users.get_guide!(id)

    case Users.update_guide(guide, guide_params) do
      {:ok, guide} ->
        conn
        |> put_flash(:info, "Guide updated successfully.")
        |> redirect(to: Routes.guide_path(conn, :show, guide))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", guide: guide, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    guide = Users.get_guide!(id)
    {:ok, _guide} = Users.delete_guide(guide)

    conn
    |> put_flash(:info, "Guide deleted successfully.")
    |> redirect(to: Routes.guide_path(conn, :index))
  end
end
