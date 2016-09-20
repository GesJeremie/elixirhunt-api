defmodule Elixirhunt.Admin.SessionController do
  use Elixirhunt.Web, :controller

  def show(conn, _params) do
    # Fetch sessions before to use them
    conn = fetch_session(conn)

    connected = get_session(conn, :connected_as_admin)
    
    case connected do
      nil -> render(conn, "not_connected.json", %{})
      false -> render(conn, "not_connected.json", %{})
      true -> render(conn, "connected.json", %{})
    end
  end

  def create(conn, %{"password" => password}) do
    if password == Application.get_env(:elixirhunt, :admin_password) do
      conn 
      |> fetch_session
      |> put_session(:connected_as_admin, true)
      |> put_status(:created)
      |> render("success.json", message: "Session created")
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render("error.json", message: "Wrong password")
    end
  end

  def revoke(conn, _params) do
    conn = conn
    |> fetch_session
    |> delete_session(:connected_as_admin)
    

    send_resp(conn, :no_content, "")
  end

end
