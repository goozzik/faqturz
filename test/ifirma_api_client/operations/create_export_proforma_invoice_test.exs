defmodule IfirmaApiClient.Operations.CreateExportProformaInvoiceTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest IfirmaApiClient.Operations.CreateExportProformaInvoice

  setup_all do
     IfirmaApiClient.HttpClient.start
  end

  test "sends request to fakturaproformaeksport endpoint and returns response" do
    params = %{
      "TypFaktury": "prz_eksport_dost_uslug_ue",
      "DataWystawienia": "2017-12-23",
      "TerminPlatnosci": "2017-12-28",
      "MiejsceWystawienia": "Częstochowa",
      "Numer": nil,
      "NazwaSeriiNumeracji": nil,
      "Jezyk": "en",
      "Waluta": "EUR",
      "Uwagi": "Order No. 589644125-17",
      "SposobZaplaty": "PRZ",
      "NumerKontaBankowego": "brak",
      "RodzajPodpisuOdbiorcy": "BPO",
      "PodpisWystawcy": "Andrzej Majeranek",
      "WidocznyNumerGios": true,
      "Pozycje": [
        %{
          "NazwaPelna": "Kanister",
          "NazwaPelnaObca": "Canister",
          "Ilosc": "2",
          "Jednostka": "sztuk",
          "JednostkaObca": "pcs",
          "CenaJednostkowa": 28.99,
          "StawkaVat": 0.00,
          "TypStawkiVat": "PRC"
        }
      ],
      "Kontrahent": %{
        "Nazwa": "John Malkovich",
        "Identyfikator": nil,
        "PrefiksUE": nil,
        "NIP": nil,
        "Ulica": "234 Laurier Avenue West",
        "KodPocztowy": "K1A 0G9",
        "Miejscowosc": "Ottawa",
        "Kraj": "Kanada",
        "Email": "john@malkovich.com",
        "Telefon": "18003031282",
        "OsobaFizyczna": true
      }
    }
    expected_response = %{
      response: %{
        "Kod": 0,
        "Informacja": "Faktura została pomyślnie dodana.",
        "Identyfikator": "3654778"
      }
    }

    use_cassette "ifirma/create_export_proforma_invoice", match_requests_on: [:request_body] do
      {:ok, response} = IfirmaApiClient.Operations.CreateExportProformaInvoice.call(params)
      response.body == expected_response
    end
  end
end
