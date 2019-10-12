defmodule BauhausWeb.PageLive do
  use Phoenix.LiveView

  def render(assigns) do
    IO.inspect("render called")
    Phoenix.View.render(BauhausWeb.PageView, "live.html", assigns)
  end

  def mount(%{id: _id}, socket) do
    if connected?(socket), do: :timer.send_interval(5000, self(), :update)

    socket =
      socket
      |> assign(:temperature, get_reading())
      |> assign(
        :letters,
        "_type___________something_____" |> String.codepoints() |> generate_letters()
      )

    {:ok, socket}
  end

  def handle_info(:update, socket) do
    temperature = get_reading()
    {:noreply, assign(socket, :temperature, temperature)}
  end

  def handle_event("validate", %{"user_input" => %{"typed" => typed}}, socket) do
    IO.inspect(typed)
    IO.inspect(generate_text(typed))

    {:noreply, assign(socket, :letters, generate_text(typed))}
    |> IO.inspect()
  end

  def get_reading(), do: 1..150 |> Enum.random()

  def generate_text(typed) do
    typed
    |> String.codepoints()
    |> Enum.map(fn l -> if l == " ", do: "_", else: l end)
    |> generate_letters()
  end

  def generate_letters([]), do: generate_letters(["_"])

  def generate_letters(letters) when length(letters) == 150 do
    letters
  end

  def generate_letters(letters) when length(letters) > 150 do
    Enum.slice(letters, 0, 150)
  end

  def generate_letters(letters) when length(letters) < 150 do
    letters = letters ++ letters
    generate_letters(letters)
  end
end
