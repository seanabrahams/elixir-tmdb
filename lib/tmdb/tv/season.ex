defmodule Tmdb.Tv.Season do
  use Tmdb.Base

  def season_number(id, season_number, params \\ %{}) do
    get!("tv/#{id}/season/#{season_number}?#{URI.encode_query(params)}").body
  end
end
