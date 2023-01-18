defmodule ExFinancialModelingPrep.Fakes.Api.CompanyProfile do
  alias Fakes.Api.Base

  @spec company_profile :: {:ok, HTTPoison.Response.t()}
  def company_profile do
    Base.ok_http_response([
      %{
        "symbol" => "AAPL",
        "price" => 145.85,
        "beta" => 1.201965,
        "volAvg" => 79_766_736,
        "mktCap" => 2_410_929_717_248,
        "lastDiv" => 0.85,
        "range" => "105.0-157.26",
        "changes" => 2.4200134,
        "companyName" => "Apple Inc.",
        "currency" => "USD",
        "cik" => "0000320193",
        "isin" => "US0378331005",
        "cusip" => "037833100",
        "exchange" => "Nasdaq Global Select",
        "exchangeShortName" => "NASDAQ",
        "industry" => "Consumer Electronics",
        "website" => "http=>//www.apple.com",
        "description" =>
          "Apple Inc. designs, manufactures, and markets smartphones, personal computers, tablets, wearables, and accessories worldwide. It also sells various related services. The company offers iPhone, a line of smartphones; Mac, a line of personal computers; iPad, a line of multi-purpose tablets; and wearables, home, and accessories comprising AirPods, Apple TV, Apple Watch, Beats products, HomePod, iPod touch, and other Apple-branded and third-party accessories. It also provides AppleCare support services; cloud services store services; and operates various platforms, including the App Store, that allow customers to discover and download applications and digital content, such as books, music, video, games, and podcasts. In addition, the company offers various services, such as Apple Arcade, a game subscription service; Apple Music, which offers users a curated listening experience with on-demand radio stations; Apple News+, a subscription news and magazine service; Apple TV+, which offers exclusive original content; Apple Card, a co-branded credit card; and Apple Pay, a cashless payment service, as well as licenses its intellectual property. The company serves consumers, and small and mid-sized businesses; and the education, enterprise, and government markets. It sells and delivers third-party applications for its products through the App Store. The company also sells its products through its retail and online stores, and direct sales force; and third-party cellular network carriers, wholesalers, retailers, and resellers. Apple Inc. was founded in 1977 and is headquartered in Cupertino, California.",
        "ceo" => "Mr. Timothy Cook",
        "sector" => "Technology",
        "country" => "US",
        "fullTimeEmployees" => "147000",
        "phone" => "14089961010",
        "address" => "1 Apple Park Way",
        "city" => "Cupertino",
        "state" => "CALIFORNIA",
        "zip" => "95014",
        "dcfDiff" => 89.92,
        "dcf" => 148.019,
        "image" => "https://financialmodelingprep.com/image-stock/AAPL.png"
      }
    ])
  end
end
