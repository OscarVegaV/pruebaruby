require "uri"
require "net/http"
require "json"

# aqui van la parte de postman y el api
def request(url,token = nil)
    url = URI("#{url}&api_key=#{token}")  # se quita uri y parentesis
    #puts url_string
    
    
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    data = JSON.parse(response.read_body)
    #puts data
end

#en esta parte estamos creando la pagina en index.html para visualizarlo en el navegador
def buid_web_page(x)

    photos = nasa_array.map{|x| x['url']}
html = ""
photos.each do |photo|
html += "<img src=\"#{photo}\">\n"
end
File.open('rover_index.html', html)
      
end    

nasa_array = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000','hFPjU1q1qeypuMY21pO1KJY8DuLTpTG7zRsj87Rb')[0..10]

puts buid_web_page(nasa_array)




