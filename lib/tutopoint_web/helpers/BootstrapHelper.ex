defmodule TutopointWeb.Bootstrap.Helper do
    use Phoenix.HTML
    alias Phoenix.HTML.Form

    def input(form, field, opts \\ []) do
    type = Phoenix.HTML.Form.input_type(form, field)

    IO.inspect form
    class = Keyword.get_values(opts, :class)

    newClassOpts = if form.errors[field], do: class ++ ["is-invalid"], else: class
    newClassOpts = Enum.join(newClassOpts, " ")
    

    newOpts = Keyword.put(opts, :class, newClassOpts)



    input = apply(Phoenix.HTML.Form, type, [form, field, newOpts])
  end 
end