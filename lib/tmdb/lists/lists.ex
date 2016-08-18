defmodule Tmdb.Lists do
  use HTTPoison.Base

  def find(id) do
    get!("list/#{id}?").body
  end

  def search(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/list?#{URI.encode_query(params)}").body
  end

  def item_status(list_id, movie_id) do
    get!("list/#{list_id}/item_status?movie_id=#{movie_id}").body
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!
  end

  defp process_url(url) do
    api_key = Application.fetch_env!(:tmdb, :api_key)
    "https://api.themoviedb.org/3/" <> url <> "&api_key=#{api_key}"
  end
end
