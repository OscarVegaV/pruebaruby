auto = {
    "marca"=>"nissan",
    "color"=>"dorado",
    "chofer"=>{
        "nombre"=>"karl",
        "edad"=>32,
        "billetera"=>{
            "id"=>111222,
            "billetes"=>5
            
        }
    }
}
# supermercado = auto["chofer"]
# puts supermercado["edad"]
# puts auto 
# puts auto["marca"]
# puts auto["chofer"]
# puts auto["chofer"]["nombre"]

supermercado = auto["chofer"]["billetera"]["billetes"]
puts supermercado