defmodule Blog.AuthController do
  use Blog.Web, :controller
  import Comeonin.Bcrypt, only: [checkpw: 2]
  import Joken

  alias Blog.User

  def login(conn, %{"username" => user, "password" => pass}) do
    user = User.find_by_username(user)
    if checkpw(pass, user.password_hash) do
      auth_token = %{id: user.id, username: user.username}
        |> token
        |> with_signer(hs256("secretstuff"))
        |> sign
        |> get_compact

      json conn, %{
        auth_token: auth_token,
        user_data: %{
          username: user.username,
          id: user.id
        }
      }
    else
      # send errors
      conn |> halt
    end
  end

  def get_verified_token(token) do
  end

end
