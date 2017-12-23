defmodule IfirmaApiClient.Operations.CreateExportProformaInvoice do
  @moduledoc """
  This module is responsible for handling requests to fakturaproformaeksport ifirma API endpoint.
  """

  @url "https://www.ifirma.pl/iapi/fakturaproformaeksport.json"

  alias IfirmaApiClient.HttpClient

  def call(params) do
    HttpClient.post(@url, params)
  end
end
