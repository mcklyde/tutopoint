defmodule Tutopoint.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Tutopoint.Repo

  alias Tutopoint.Users.Guide
  alias Tutopoint.Users.Client
  alias Tutopoint.Users.User



  @doc """
  Returns the list of guides.

  ## Examples

      iex> list_guides()
      [%Guide{}, ...]

  """
  def list_guides do
    Repo.all(Guide)
  end

  @doc """
  Gets a single guide.

  Raises `Ecto.NoResultsError` if the Guide does not exist.

  ## Examples

      iex> get_guide!(123)
      %Guide{}

      iex> get_guide!(456)
      ** (Ecto.NoResultsError)

  """
  def get_guide!(id), do: Repo.get!(Guide, id, preload: :account)

  @doc """
  Creates a guide.

  ## Examples

      iex> create_guide(%{field: value})
      {:ok, %Guide{}}

      iex> create_guide(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_guide(attrs \\ %{}) do
    userChangeset = %User{} |> User.changeset(attrs) |> User.changeset_role(%{role: "guide"})

    # Put some invalid user id in. Will crash when not properly set after user has registered.
    guideChangeset = %Guide{user_id: 9999}
    |> Guide.changeset(attrs)

    if userChangeset.valid? and guideChangeset.valid? do
      case userChangeset |> Repo.insert() do
        {:ok, user} -> 
          id = user |> Map.fetch!(:id)
          IO.puts id
          guideChangeset |> Guide.changeset(%{user_id: id}) |> Repo.insert()
        {:error, errorReason} ->
          errorReason

      end
    else
      Map.put(userChangeset, :errors, userChangeset.errors ++ guideChangeset.errors)

    end
  end

  @doc """
  Updates a guide.

  ## Examples

      iex> update_guide(guide, %{field: new_value})
      {:ok, %Guide{}}

      iex> update_guide(guide, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_guide(%Guide{} = guide, attrs) do
    guide
    |> Guide.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a guide.

  ## Examples

      iex> delete_guide(guide)
      {:ok, %Guide{}}

      iex> delete_guide(guide)
      {:error, %Ecto.Changeset{}}

  """
  def delete_guide(%Guide{} = guide) do
    Repo.delete(guide)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking guide changes.

  ## Examples

      iex> change_guide(guide)
      %Ecto.Changeset{data: %Guide{}}

  """
  def change_guide(%Guide{} = guide, attrs \\ %{}) do
    Guide.changeset(guide, attrs)
  end

  alias Tutopoint.Users.Client

  @doc """
  Returns the list of clients.

  ## Examples

      iex> list_clients()
      [%Client{}, ...]

  """
  def list_clients do
    Repo.all(Client)
  end

  @doc """
  Gets a single client.

  Raises `Ecto.NoResultsError` if the Client does not exist.

  ## Examples

      iex> get_client!(123)
      %Client{}

      iex> get_client!(456)
      ** (Ecto.NoResultsError)

  """
  def get_client!(id), do: Repo.get!(Client, id)

  @doc """
  Creates a client.

  ## Examples

      iex> create_client(%{field: value})
      {:ok, %Client{}}

      iex> create_client(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client(attrs \\ %{}) do
    userChangeset = %User{} |> User.changeset(attrs) |> User.changeset_role(%{role: "user"})

    # Put some invalid user id in. Will crash when not properly set after user has registered.
    clientChangeset = %Client{user_id: 9999}
    |> Client.changeset(attrs)

    if userChangeset.valid? and clientChangeset.valid? do
      case userChangeset |> Repo.insert() do
        {:ok, user} -> 
          id = user |> Map.fetch!(:id)
          IO.puts id
          clientChangeset |> Client.changeset(%{user_id: id}) |> Repo.insert()
        {:error, errorReason} ->
          errorReason

      end
    else
      Map.put(userChangeset, :errors, userChangeset.errors ++ clientChangeset.errors)

    end
  end

  @doc """
  Updates a client.

  ## Examples

      iex> update_client(client, %{field: new_value})
      {:ok, %Client{}}

      iex> update_client(client, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client(%Client{} = client, attrs) do
    client
    |> Client.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a client.

  ## Examples

      iex> delete_client(client)
      {:ok, %Client{}}

      iex> delete_client(client)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client(%Client{} = client) do
    Repo.delete(client)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client changes.

  ## Examples

      iex> change_client(client)
      %Ecto.Changeset{data: %Client{}}

  """
  def change_client(%Client{} = client, attrs \\ %{}) do
    Client.changeset(client, attrs)
  end
end
