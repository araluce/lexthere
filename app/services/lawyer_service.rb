class LawyerService
  require 'net/http'
  require 'json'

  HEADERS = {
      'Host' => 'www.ecolegio.org',
      'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.29.13 (KHTML, like Gecko) Version/6.0.4 Safari/536.29.13',
      'Content-Length' => '0',
      'Accept' => 'application/json, text/javascript, */*; q=0.01',
      'Origin' => 'http://www.redabogacia.org',
      'Content-Type' => 'application/x-www-form-urlencoded; charset=UTF-8',
      'Referer' => 'http://www.redabogacia.org/mobile/censo/',
      'Accept-Language' => 'es-es',
      'Accept-Encoding' => 'gzip, deflate',
      'Connection' => 'keep-alive'
  }

  BODY = {
      action: 'search',
      colegiado: '',
      colegio: '',
      pagina: '1',
      nregistros: '-1'
  }

  SERVICE_URL = 'http://www.ecolegio.org'.freeze
  SERVICE_PATH = "/ecensofront/ws/censoletrados".freeze

  def initialize(name, surnames)
    @name, @surnames = name, surnames
  end

  def perform
    uri = URI("#{SERVICE_URL}#{SERVICE_PATH}")

    http = Net::HTTP.new(uri.host, uri.port)

    params = BODY.merge({nombre: @name, apellidos: @surnames})

    req = Net::HTTP::Post.new("#{uri.path}?#{params.to_query}", HEADERS)
    req.body = params.to_json

    res = http.request(req)

    JSON.parse(res.body)
  end


end