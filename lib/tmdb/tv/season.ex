defmodule Tmdb.Tv.Season do
  use HTTPoison.Base

  def season_number(id, season_number, params \\ %{}) do
    get!("tv/#{id}/season/#{season_number}?#{URI.encode_query(params)}").body
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
