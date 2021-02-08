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
def buid_web_page(info_hash)
    
    File.open('rover_index.html','w') do |file|       
        
        file.puts "<html>
        <head>
        </head>
        <body>
        <ul>
        <li><img src='#{info_hash['photos'][0]['img_src']}'width ='150'</li>
        <li><img src='#{info_hash['photos'][1]['img_src']}'width ='150'</li>
        <li><img src='.../398381687EDR_F0030000CCAM05010M_.JPG'></li>
        </ul>
        </body>
        </html>"
    end      
end    

nasa_array = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000','hFPjU1q1qeypuMY21pO1KJY8DuLTpTG7zRsj87Rb')
puts buid_web_page(nasa_array)


