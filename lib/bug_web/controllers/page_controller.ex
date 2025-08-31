defmodule BugWeb.PageController do
  use BugWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
