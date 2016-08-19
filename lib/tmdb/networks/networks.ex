defmodule Tmdb.Networks do
  use Tmdb.Base

  @doc ~S"""
  Find networks by ID
    ## Required Parameters
    api_key
    ## Optional Parameters
    append_to_response:	Comma separated, any company method
    ## Examples
    iex(3)> Tmdb.Networks.find(4)
    %{"id" => 4, "name" => "BBC One"}
  """
  def find(id) do
    get!("network/#{id}?").body
  end
end
