defmodule Tmdb.Movies do
  use HTTPoison.Base

  def find(id) do
    get!("movie/#{id}?append_to_response=trailers").body
  end

  def genres do
    get!("genre/movie/list?").body
  end

  def images(movie) do
    get!("movie/#{movie.tmdb_id}/images?").body
  end

  def latest(params \\ %{}) do
    get!("movie/latest?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def now_playing(params \\ %{}) do
    get!("movie/now_playing?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def popular(params \\ %{}) do
    get!("movie/popular?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def search(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/movie?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def similar(movie, params \\ %{}) do
    get!("movie/#{movie.tmdb_id}/similar?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def top(params \\ %{}) do
    get!("movie/top_rated?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def upcoming(params \\ %{}) do
    get!("movie/upcoming?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def videos(movie) do
    get!("movie/#{movie.tmdb_id}/videos?").body
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
