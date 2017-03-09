defmodule LinkShortener.Links do

  @doc """
    Shortens a given `url`.
  """
  def shorten(url) do
    params = %{longUrl: url}
    LinkShortener.post!("id", Poison.encode!(params)).body
  end

end
