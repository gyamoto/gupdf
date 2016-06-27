defmodule Recursion do
  def getGup(n) when n <= 148 do
    requestPdf(n)
  end

  def getGup(n) do
    requestPdf(n)
    getGup(n - 1)
  end

  def requestPdf(n) do
    IO.puts "request #{n}"

    url = "http://girls-und-panzer.jp/img/special/web_#{n}r_b.pdf"
    %HTTPoison.Response{body: body, status_code: status} = HTTPoison.get!(url)

    if status == 200 do
      file = "special/web_#{n}r_b.pdf"
      File.write!(file, body)
      IO.puts "save #{file}"
    else 
      IO.puts "failed to get #{url}"
    end
  end
end

HTTPoison.start
Recursion.getGup(150)
