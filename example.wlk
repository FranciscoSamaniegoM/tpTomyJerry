object casa {
  var suciedad = 100
  var cuidador = tom
  var quilombero = pandilla



  method modificarSuciedad(valor) {
    suciedad += valor
  }

  method interrumpirSuenioCuidador() {
    cuidador.interrumpirSuenio()
  }

  method suciedad() = suciedad

  method pasaElDia() {
    cuidador.limpiarCasa(self)
    if(cuidador.puedeAtraparQuilombero(quilombero)) {
      quilombero = quilomberoNulo
    }
  }

  method pasaLaNoche() {
    cuidador.dormir()
    quilombero.hacerQuilombo(self)
  }

  method cuidador(nuevoCuidador) {
    cuidador = nuevoCuidador
  }
 
}

object quilomberoNulo {
  method hacerQuilombo(casa) {
  }

  method velocidad() = 0
}

object pandilla {
   const quilomberos = [jerry,terry]
   method hacerQuilombo(casa) {
    if(quilomberos.size() > 3) {
      casa.interrumpirSuenioCuidador()
    }
    quilomberos.map({quilombero => quilombero.hacerQuilombo(casa)})

  }

  method velocidad() = self.obtenerVelocidades().min() / 2

  method obtenerVelocidades() = quilomberos.map({quilombero => quilombero.velocidad()})
}

object tom {
  var energia = 100

  method energia() = energia

  method velocidad() = 5 + (energia / 10)

  method limpiarCasa(casa) {
    energia -= 40
    casa.modificarSuciedad(-100)
  }

  method dormir() {
    energia += 50
  } 

  method puedeAtraparQuilombero(quilombero) = (quilombero.velocidad() < self.velocidad())

  method interrumpirSuenio() {
    energia -= 20
  }
}
object moria {
  var energia = 100


  method velocidad() = 5 + (energia / 10)

  method limpiarCasa(casa) {
    energia -= 70
    casa.modificarSuciedad(-1)
  }

  method dormir() {
    energia += 50
  } 

  method puedeAtraparQuilombero(quilombero) = (quilombero == terry)

  method interrumpirSuenio() {
    energia -= 40
  }
}

object jerry {
  var peso = 5

  method hacerQuilombo(casa) {
    peso+= 1
    casa.modificarSuciedad(110)
  }

  method velocidad() = 10 - peso
}

object terry {
  var peso = 50

  method hacerQuilombo(casa) {
    peso+= 5
    casa.modificarSuciedad(200)
    casa.interrumpirSuenioCuidador()
  }

  method velocidad() = 5
}

object tuffy {

  method velocidad() = 10

   method hacerQuilombo(casa) {
    casa.interrumpirSuenioCuidador()
   }
}

object robocat {


  method puedeAtraparQuilombero(quilombero) = true

  method limpiarCasa(casa) {
    casa.modificarSuciedad(-(casa.suciedad()))
  }

  method interrumpirSuenio() {  
  }
}

//interfaz de los quilomberos:
//velocidad y hacerQuilombo

//interfaz de los cuidadores:
//puedeAtraparQuilombero, limpiarCasa e interrumpirSuenio
