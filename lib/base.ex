defmodule Tmdb.Base do
  defmacro __using__(_) do
    quote do
      use HTTPoison.Base

      defp process_response_body(body) do
        body
        |> Poison.decode!
      end

      defp process_url(url) do
        api_key = Application.fetch_env!(:tmdb, :api_key)
        "https://api.themoviedb.org/3/" <> url <> "&api_key=#{api_key}"
      end
    end
  end
end
