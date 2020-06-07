defmodule Tutopoint.CourseTest do
  use Tutopoint.DataCase

  alias Tutopoint.Course

  describe "classes" do
    alias Tutopoint.Course.Class

    @valid_attrs %{comments: "some comments", course_type: "some course_type", date: ~N[2010-04-17 14:00:00], description: "some description", instructor: 42, max_student: 42, min: 42, pay_upfront: true, price: 42, structure: "some structure", subs: 42, title: "some title", waitlist: true}
    @update_attrs %{comments: "some updated comments", course_type: "some updated course_type", date: ~N[2011-05-18 15:01:01], description: "some updated description", instructor: 43, max_student: 43, min: 43, pay_upfront: false, price: 43, structure: "some updated structure", subs: 43, title: "some updated title", waitlist: false}
    @invalid_attrs %{comments: nil, course_type: nil, date: nil, description: nil, instructor: nil, max_student: nil, min: nil, pay_upfront: nil, price: nil, structure: nil, subs: nil, title: nil, waitlist: nil}

    def class_fixture(attrs \\ %{}) do
      {:ok, class} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Course.create_class()

      class
    end

    test "list_classes/0 returns all classes" do
      class = class_fixture()
      assert Course.list_classes() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert Course.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      assert {:ok, %Class{} = class} = Course.create_class(@valid_attrs)
      assert class.comments == "some comments"
      assert class.course_type == "some course_type"
      assert class.date == ~N[2010-04-17 14:00:00]
      assert class.description == "some description"
      assert class.instructor == 42
      assert class.max_student == 42
      assert class.min == 42
      assert class.pay_upfront == true
      assert class.price == 42
      assert class.structure == "some structure"
      assert class.subs == 42
      assert class.title == "some title"
      assert class.waitlist == true
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Course.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      assert {:ok, %Class{} = class} = Course.update_class(class, @update_attrs)
      assert class.comments == "some updated comments"
      assert class.course_type == "some updated course_type"
      assert class.date == ~N[2011-05-18 15:01:01]
      assert class.description == "some updated description"
      assert class.instructor == 43
      assert class.max_student == 43
      assert class.min == 43
      assert class.pay_upfront == false
      assert class.price == 43
      assert class.structure == "some updated structure"
      assert class.subs == 43
      assert class.title == "some updated title"
      assert class.waitlist == false
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = Course.update_class(class, @invalid_attrs)
      assert class == Course.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = Course.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> Course.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = Course.change_class(class)
    end
  end
end
