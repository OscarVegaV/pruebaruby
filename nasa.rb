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
        
        file.puts " <!doctype html>
        <html lang='es'>
        <head>
        <!-- Required meta tags -->
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>                    
        <title>Prueba nasa</title>
        </head>            
        <body>
        <div class='container parrafo'>
        <div class='row'>
        <div class='col span='2' style='background-color:coral'>       
        <ul>"   
        
        info_hash['photos'].each do |photo,id|            
            file.puts "<h1>'#{photo["camera"]["full_name"]}'</h1>"
            file.puts "<li><img src='#{photo["img_src"]}'width='150px'></li>"
            file.puts "<p>'#{photo["id"]}'</p>"
        end
        
        file.puts "</ul>
        </div>          
        </div>
        </div>
        </body>
        </html> "
    end      
end    

nasa_array = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000','hFPjU1q1qeypuMY21pO1KJY8DuLTpTG7zRsj87Rb')
puts buid_web_page(nasa_array)
