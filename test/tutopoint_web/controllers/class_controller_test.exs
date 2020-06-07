defmodule TutopointWeb.ClassControllerTest do
  use TutopointWeb.ConnCase

  alias Tutopoint.Course

  @create_attrs %{comments: "some comments", course_type: "some course_type", date: ~N[2010-04-17 14:00:00], description: "some description", instructor: 42, max_student: 42, min: 42, pay_upfront: true, price: 42, structure: "some structure", subs: 42, title: "some title", waitlist: true}
  @update_attrs %{comments: "some updated comments", course_type: "some updated course_type", date: ~N[2011-05-18 15:01:01], description: "some updated description", instructor: 43, max_student: 43, min: 43, pay_upfront: false, price: 43, structure: "some updated structure", subs: 43, title: "some updated title", waitlist: false}
  @invalid_attrs %{comments: nil, course_type: nil, date: nil, description: nil, instructor: nil, max_student: nil, min: nil, pay_upfront: nil, price: nil, structure: nil, subs: nil, title: nil, waitlist: nil}

  def fixture(:class) do
    {:ok, class} = Course.create_class(@create_attrs)
    class
  end

  describe "index" do
    test "lists all classes", %{conn: conn} do
      conn = get(conn, Routes.class_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Classes"
    end
  end

  describe "new class" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.class_path(conn, :new))
      assert html_response(conn, 200) =~ "New Class"
    end
  end

  describe "create class" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.class_path(conn, :create), class: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.class_path(conn, :show, id)

      conn = get(conn, Routes.class_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Class"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.class_path(conn, :create), class: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Class"
    end
  end

  describe "edit class" do
    setup [:create_class]

    test "renders form for editing chosen class", %{conn: conn, class: class} do
      conn = get(conn, Routes.class_path(conn, :edit, class))
      assert html_response(conn, 200) =~ "Edit Class"
    end
  end

  describe "update class" do
    setup [:create_class]

    test "redirects when data is valid", %{conn: conn, class: class} do
      conn = put(conn, Routes.class_path(conn, :update, class), class: @update_attrs)
      assert redirected_to(conn) == Routes.class_path(conn, :show, class)

      conn = get(conn, Routes.class_path(conn, :show, class))
      assert html_response(conn, 200) =~ "some updated comments"
    end

    test "renders errors when data is invalid", %{conn: conn, class: class} do
      conn = put(conn, Routes.class_path(conn, :update, class), class: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Class"
    end
  end

  describe "delete class" do
    setup [:create_class]

    test "deletes chosen class", %{conn: conn, class: class} do
      conn = delete(conn, Routes.class_path(conn, :delete, class))
      assert redirected_to(conn) == Routes.class_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.class_path(conn, :show, class))
      end
    end
  end

  defp create_class(_) do
    class = fixture(:class)
    %{class: class}
  end
end
