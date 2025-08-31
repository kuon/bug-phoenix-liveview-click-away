defmodule BugWeb.PageLive do
  use BugWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, picker_visible: false)
    {:ok, socket}
  end

  def handle_event("show_picker", _params, socket) do
    {:noreply, assign(socket, picker_visible: true)}
  end

  def handle_event("hide_picker", _params, socket) do
    {:noreply, assign(socket, picker_visible: false)}
  end

  def handle_event("reset_date", _params, socket) do
    {:noreply, assign(socket, picker_visible: false)}
  end

  def render(assigns) do
    ~H"""
    <div class="p-4">
      <div class="my-4">Bug demo</div>

      <div
        id="date-picker"
        phx-hook="date_time_picker"
        class="relative"
        phx-click="show_picker"
        phx-click-away="hide_picker"
      >
        <div class={[
          "flex gap-2 items-center",
          "border border-gray-300 rounded-md px-2 py-1",
          "bg-gray-200/50"
        ]}>
          <div class="grow flex items-baseline gap-3">
            formatted date here
          </div>
          <div
            class="pl-4"
            phx-click="reset_date"
          >
            <div class="hero-x-mark w-8 h-8 text-gray-400" />
          </div>
        </div>
        <div
          id={"wrapper"}
          class={[
            "absolute w-64 h-96",
            !@picker_visible && "hidden"
          ]}
        >
          <div id={"subwrapper"} phx-update="ignore">
            <div data-calendar />
          </div>
        </div>
      </div>
    </div>
    """
  end
end
