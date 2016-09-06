defmodule Tmdb.Lists do
  use Tmdb.Base

  def find(id) do
    get!("list/#{id}?").body
  end

  def item_status(list_id, movie_id) do
    get!("list/#{list_id}/item_status?movie_id=#{movie_id}").body
  end
end
