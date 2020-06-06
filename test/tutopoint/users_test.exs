defmodule Tutopoint.UsersTest do
  use Tutopoint.DataCase

  alias Tutopoint.Users

  describe "guides" do
    alias Tutopoint.Users.Guide

    @valid_attrs %{
      college: "some college",
      grade: "some grade",
      hs: "some hs",
      language: "some language",
      major: "some major",
      stripeid: "some stripeid"
    }
    @update_attrs %{
      college: "some updated college",
      grade: "some updated grade",
      hs: "some updated hs",
      language: "some updated language",
      major: "some updated major",
      stripeid: "some updated stripeid"
    }
    @invalid_attrs %{college: nil, grade: nil, hs: nil, language: nil, major: nil, stripeid: nil}

    def guide_fixture(attrs \\ %{}) do
      {:ok, guide} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_guide()

      guide
    end

    test "list_guides/0 returns all guides" do
      guide = guide_fixture()
      assert Users.list_guides() == [guide]
    end

    test "get_guide!/1 returns the guide with given id" do
      guide = guide_fixture()
      assert Users.get_guide!(guide.id) == guide
    end

    test "create_guide/1 with valid data creates a guide" do
      assert {:ok, %Guide{} = guide} = Users.create_guide(@valid_attrs)
      assert guide.college == "some college"
      assert guide.grade == "some grade"
      assert guide.hs == "some hs"
      assert guide.language == "some language"
      assert guide.major == "some major"
      assert guide.stripeid == "some stripeid"
    end

    test "create_guide/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_guide(@invalid_attrs)
    end

    test "update_guide/2 with valid data updates the guide" do
      guide = guide_fixture()
      assert {:ok, %Guide{} = guide} = Users.update_guide(guide, @update_attrs)
      assert guide.college == "some updated college"
      assert guide.grade == "some updated grade"
      assert guide.hs == "some updated hs"
      assert guide.language == "some updated language"
      assert guide.major == "some updated major"
      assert guide.stripeid == "some updated stripeid"
    end

    test "update_guide/2 with invalid data returns error changeset" do
      guide = guide_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_guide(guide, @invalid_attrs)
      assert guide == Users.get_guide!(guide.id)
    end

    test "delete_guide/1 deletes the guide" do
      guide = guide_fixture()
      assert {:ok, %Guide{}} = Users.delete_guide(guide)
      assert_raise Ecto.NoResultsError, fn -> Users.get_guide!(guide.id) end
    end

    test "change_guide/1 returns a guide changeset" do
      guide = guide_fixture()
      assert %Ecto.Changeset{} = Users.change_guide(guide)
    end
  end

  describe "clients" do
    alias Tutopoint.Users.Client

    @valid_attrs %{name: "some name", phone: "some phone", stripe: "some stripe"}
    @update_attrs %{name: "some updated name", phone: "some updated phone", stripe: "some updated stripe"}
    @invalid_attrs %{name: nil, phone: nil, stripe: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Users.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Users.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Users.create_client(@valid_attrs)
      assert client.name == "some name"
      assert client.phone == "some phone"
      assert client.stripe == "some stripe"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, %Client{} = client} = Users.update_client(client, @update_attrs)
      assert client.name == "some updated name"
      assert client.phone == "some updated phone"
      assert client.stripe == "some updated stripe"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_client(client, @invalid_attrs)
      assert client == Users.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Users.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Users.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Users.change_client(client)
    end
  end
end
