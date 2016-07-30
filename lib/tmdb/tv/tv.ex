defmodule Tmdb.Tv do
  use HTTPoison.Base

  def find(id, params \\ %{}) do
    get!("tv/#{id}?#{URI.encode_query(params)}").body
  end

  def account_states(id, session_id) do
    get!("tv/#{id}/account_states?#{URI.encode(session_id)}").body
  end

  def alternative_titles(id) do
    get!("tv/#{id}/alternative_titles?").body
  end

  def changes(id, params \\ %{}) do
    get!("tv/#{id}/changes?#{URI.encode_query(params)}").body
  end

  def content_ratings(id) do
    get!("tv/#{id}/content_ratings?").body
  end

  def credits(id, params \\ %{}) do
    get!("tv/#{id}/credits?#{URI.encode_query(params)}").body
  end

  def external_ids(id, params \\ %{}) do
    get!("tv/#{id}/external_ids?#{URI.encode_query(params)}").body
  end

  def images(id, params \\ %{}) do
    get!("tv/#{id}/images?#{URI.encode_query(params)}").body
  end

  def keywords(id, params \\ %{}) do
    get!("tv/#{id}/keywords?#{URI.encode_query(params)}").body
  end

  def rating(id, params \\ %{}) do
    get!("tv/#{id}/rating?#{URI.encode_query(params)}").body
  end

  def similar(id, params \\ %{}) do
    get!("tv/#{id}/similar?#{URI.encode_query(params)}").body
  end

  def translations(id) do
    get!("tv/#{id}/translations?").body
  end

  def videos(id, params \\ %{}) do
    get!("tv/#{id}/videos?#{URI.encode_query(params)}").body
  end

  def latest do
    get!("tv/latest").body
  end

  def on_the_air(params \\ %{}) do
    get!("tv/on_the_air?#{URI.encode_query(params)}").body
  end

  def airing_today(params \\ %{}) do
    get!("tv/airing_today?#{URI.encode_query(params)}").body
  end

  def top_rated(params \\ %{}) do
    get!("tv/top_rated?#{URI.encode_query(params)}").body
  end

  def popular(params \\ %{}) do
    get!("tv/popular?#{URI.encode_query(params)}").body
  end

  # Example response:
  #
  # %HTTPoison.Response{
  #   headers: [
  #     {"Access-Control-Allow-Origin", "*"},
  #     {"Cache-Control", "public, max-age=21600"},
  #     {"Content-Type", "application/json;charset=utf-8"},
  #     {"Date", "Tue, 17 May 2016 20:02:58 GMT"},
  #     {"ETag", "9fe8593a8a330607d76796b35c64c600"},
  #     {"Server", "openresty"},
  #     {"X-RateLimit-Limit", "40"},
  #     {"X-RateLimit-Remaining", "39"},
  #     {"X-RateLimit-Reset", "1463515388"},
  #     {"Content-Length", "678"},
  #     {"Connection", "keep-alive"}
  #   ],
  #   status_code: 200,
  #   body: %{
  #   "page" => 1,
  #   "results" => [ ... Movies ... ]
  #   "total_pages" => 985,
  #   "total_results" => 19684
  #   }
  # }
  defp process_response_body(body) do
    body
    |> Poison.decode!
  end

  defp process_url(url) do
    api_key = Application.fetch_env!(:tmdb, :api_key)
    "https://api.themoviedb.org/3/" <> url <> "&api_key=#{api_key}"
  end
end
