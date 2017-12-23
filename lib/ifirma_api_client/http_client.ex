require IEx

defmodule IfirmaApiClient.HttpClient do
  @moduledoc """
  This module is responsible for handling general request and response handling of ifirma API.
  """

  use HTTPoison.Base

  alias IfirmaApiClient.Authentication

  def post(url, raw_params) do
    params = Poison.encode!(raw_params)
    headers = [
      {"Content-Type", "application/json"},
      {"Authentication", Authentication.generate_auth_header(url, params)}
    ]

    post(url, params, headers)
  end

  defp process_response_body(body) do
    Poison.decode!(body)
  end
end
