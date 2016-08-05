defmodule Tmdb.People do
  use HTTPoison.Base

  def find(id, params \\ %{}) do
    get!("person/#{id}?#{URI.encode_query(params)}").body
  end

  # TODO: Regarding `find_all` I think what you want is to update `find(id)` to `find(id, params \\ %{})` and allow people to pass in what they want the value of `added_to_response` to be.
  # So you'd call `Tmdb.People.find(some_id, %{added_to_response: "movie_credits,tv_credits"})`
  ## ?append_to_response=movie_credits,tv_credits,external_ids,images,tagged_images,changes

  def popular(params \\ %{}) do
    get!("person/popular?#{URI.encode_query(params)}").body
  end

  def latest(params \\ %{}) do
    get!("person/latest?#{URI.encode_query(params)}").body
  end

  def search(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/person?#{URI.encode_query(params)}").body
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
