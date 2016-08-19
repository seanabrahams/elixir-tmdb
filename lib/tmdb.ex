defmodule Tmdb do
  use Tmdb.Base

  def configuration do
    get!("configuration?").body
  end
end
