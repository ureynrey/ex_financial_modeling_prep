defmodule ExFinancialModelingPrep.Api.CompanyInformationTest do
  use ExUnit.Case
  alias ExFinancialModelingPrep.Api.CompanyInformation
  alias ExFinancialModelingPrep.Struct.CompanyProfile
  alias ExFinancialModelingPrep.Fakes.Api.CompanyProfile, as: Mock
  import Mox

  test "company_profile/1" do
    expect(HTTPMock, :get, fn _ -> Mock.company_profile() end)
    {:ok, [head | _tail]} = CompanyInformation.company_profile("APPL")
    # assert %CompanyProfile{} = Enum.at(profile, 0)
    assert %CompanyProfile{} = head
  end

  test "company_profile fails" do
    expect(HTTPMock, :get, fn _ -> {:error, "something went wrong"} end)
    assert {:error, reason} = CompanyInformation.company_profile("APPL")
  end
end
