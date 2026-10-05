object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuadoDeFrutas{
  var cantDeNutrientes = 0
  method rendimientoQueOtorga(dosis){
    
    return  cantDeNutrientes * ( dosis / 1000)
  } 
  
  method agregarIngrediente(nutriente){
    cantDeNutrientes += nutriente
  }
}

object aguaSaborizada{
  var otraBebida = whisky
  method rendimientoQueOtorga(dosis) = 1 + otraBebida.rendimientoQueOtorga(dosis*0.25)
  method cambiarBebida(bebida){
    otraBebida = bebida
  }
}

object coctel {
  const bebidas=[whisky,terere]
  method rendimientoQueOtorga(proporcionDeBebida){
    var rendimientoTotal = 1
    bebidas.forEach{b => rendimientoTotal *= b.rendimientoQueOtorga(proporcionDeBebida)}
    return rendimientoTotal
  }
  method agregarBebida(bebida){
    bebidas.add(bebida)
  }
  method quitarBebida(bebida){
    bebidas.remove(bebida)
  }
  
}
