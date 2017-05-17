defmodule Recursion do
  def getGup(n) do
    case requestPdf(n) do
      :ok -> getGup(n + 1)
      :ng -> IO.puts "bye"
    end
  end

  def requestPdf(n) do
    number = String.rjust(Integer.to_string(n), 2, ?0)
    IO.puts "requesting #{number}..."

    url = "http://girls-und-panzer.jp/img/special/web_#{number}r_b.pdf"
    %HTTPoison.Response{body: body, status_code: status} = HTTPoison.get!(url)

    if status == 200 do
      file = "special/web_#{n}r_b.pdf"
      File.write!(file, body)
      IO.puts "save #{file} (๑´ڡ`๑)"
      :ok
    else
      IO.puts "failed to get #{url} _(:3」∠)_"
      :ng
    end
  end
end

HTTPoison.start
Recursion.getGup(194)
