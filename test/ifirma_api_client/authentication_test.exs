defmodule IfirmaApiClient.AuthenticationTest do
  use ExUnit.Case

  doctest IfirmaApiClient.Authentication

  test "generates and returns authentication header" do
    url = "https://www.ifirma.pl/iapi/fakturakraj/list.json"
    request_content = "test body"
    expected_header = "IAPIS user=test@example.com, hmac-sha1=6cfa21c42485cc7b40b7868106d91cf885b86655"

    assert IfirmaApiClient.Authentication.generate_auth_header(url, request_content) == expected_header
  end
end
