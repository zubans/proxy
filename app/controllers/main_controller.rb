class MainController < ApplicationController
  require 'net-telnet'
  def index
    # proxy_addr = 'http://80.244.41.249'
    # proxy_port = 8080
    rest_client = RestClient
    Connection.all.each do |connection|
      proxy_addr = connection.address
      proxy_port = connection.port

      rest_client.proxy = "http://#{proxy_addr}:#{proxy_port}"
      # response = rest_client.get 'http://unost-kursk.ru'
      begin
        response = rest_client.get 'http://unost-kursk.ru'
        connection.status = 1
      rescue
        connection.status = 0
      end
      connection.save!
    end

    render plain: response.body
  end

  def get_proxy
    proxies = [
      '82.198.188.10:80',
    '85.26.146.169:80',
    '213.219.238.30:8081',
    '188.133.173.21:8080',
    '185.127.224.60:41890',
    '62.33.207.202:80',
    '195.170.38.230:8080',
    '83.239.18.34:3128',
    '78.36.198.158:80',
    '188.133.154.149:8080',
    '80.244.41.249:8080',
    '178.130.102.114:8080',
    '217.21.214.139:8080',
    '89.20.48.118:8080',
    '5.16.1.17:8080',
    '188.133.152.125:8080',
    '185.199.8.23:8080',
    '109.73.40.45:8080',
    '176.227.188.66:53281',
    '178.167.67.233:53281',
    '82.202.202.2:5001',
    '94.228.194.18:41890',
    '188.133.157.61:10000',
    '46.243.220.232:8118',
    '213.242.252.137:3128',
    '80.244.234.23:1256',
    '93.91.112.247:41258',
    '82.204.150.190:3129',
    '31.131.67.14:8080',
    '85.30.215.48:32946',
    '05.167.141.239:3128',
    '193.150.117.5:8000',
    '62.140.233.192:41258',
    '83.219.149.154:8080',
    '80.244.231.133:8080',
    ]

    proxies.each do |proxy|
      proxy = proxy.split(':')
      Connection.create(address: proxy[0], port: proxy[1])
      end
  end
end
