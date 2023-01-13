defmodule ExFinancialModelingPrep.Api.KeyExecutivesTest do
  use ExUnit.Case
  alias ExFinancialModelingPrep.Api.CompanyInformation
  alias ExFinancialModelingPrep.Struct
  alias ExFinancialModelingPrep.Fakes.Api.KeyExecutives, as: Mock

  import Mox

  test "key_executives/1" do
    expect(HTTPMock, :get, fn _ -> Mock.key_executives() end)
    {:ok, [head | _tail]} = CompanyInformation.key_executives("APPL")
    assert %Struct.KeyExecutives{} = head
  end

  test "key_executives fails" do
    expect(HTTPMock, :get, fn _ -> {:error, :list_is_empty} end)
    assert {:error, reason} = CompanyInformation.key_executives("APPL")
  end

end
