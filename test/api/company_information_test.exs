defmodule ExFinancialModelingPrep.Api.CompanyInformationTest do
  use ExUnit.Case
  alias ExFinancialModelingPrep.Api.CompanyInformation
  alias ExFinancialModelingPrep.Fakes.Api.CompanyProfile, as: Mock
  alias ExFinancialModelingPrep.Struct.CompanyProfile
  import Mox

  test "company_profile/1" do
    expect(HTTPMock, :get, fn _ -> Mock.company_profile() end)
    assert {:ok, %CompanyProfile{}} = CompanyInformation.company_profile("APPL")
  end

  test "company_profile fails" do
    expect(HTTPMock, :get, fn _ -> {:error, "something went wrong"} end)
    assert {:error, reason} = CompanyInformation.company_profile("APPL")
  end
end
