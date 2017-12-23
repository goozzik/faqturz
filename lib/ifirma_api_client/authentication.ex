defmodule IfirmaApiClient.Authentication do
  @moduledoc """
  This module is responsible for generation of Authentication HTTP request header that is required to make calls to
  ifirma API.
  """

  @username Application.get_env(:faqturz, IfirmaApiClient)[:username]
  @auth_key Application.get_env(:faqturz, IfirmaApiClient)[:auth_key]

  def generate_auth_header(url, request_content) do
    data = "#{url}#{@username}faktura#{request_content}"

    "IAPIS user=#{@username}, hmac-sha1=#{encode_data(data)}"
  end

  defp encode_data(data) do
    hmac_sha1 = :crypto.hmac(:sha, decoded_api_key(), data)
    hmac_sha1
      |> Base.encode16
      |> String.downcase
  end

  defp decoded_api_key do
    hex_values = Regex.scan(~r/../, @auth_key)
    hex_values
      |> List.flatten
      |> Enum.map(fn(x) -> String.to_integer(x, 16) end)
      |> :binary.list_to_bin
  end
end
