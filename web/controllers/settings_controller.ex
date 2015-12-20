defmodule Blog.SettingsController do
  use Blog.Web, :controller

	def index(conn, _) do
	end

	def update(conn, %{"name" => name, "value" => value}) when is_map(value) do
	end

	def update(conn, %{"name" => name, "value" => value}) when is_bitstring(value) do
		setting = Blog.Repo.get_by! Blog.Setting, name: name
		setting = %{ setting | text: value }
		case Blog.Repo.update setting do
			{:ok, setting} -> json conn, setting: setting
			{:error, errors} -> json conn, errors: errors
		end
	end

end
