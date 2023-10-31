
class OleadasDeMinions {
	var plusDanio
	var cantidadDeMinios
	
	method danioProducido() = cantidadDeMinios + plusDanio
	
	method cantidadDeMinios() = cantidadDeMinios
	
	method plusDanio() = plusDanio
	
	method batallarContra(campeon){
		cantidadDeMinios = campeon.puntosDeAtaque() / 2
		if(campeon.puntosDeAtaque().between(20,41)){
			plusDanio = plusDanio - 1
		}else if(campeon.puntosDeAtaque() > 40){
			plusDanio = plusDanio - 2
		}
	}
	
	method efectoOleadaBatallaCon(unCampeon){
		cantidadDeMinios = 0.max(cantidadDeMinios - (unCampeon.puntosDeAtaque() / 2))
	}
}

class EjercitoDeMinions inherits OleadasDeMinions{
	const property oleadaMinions = []
	
	override method danioProducido() = self.cantidadTotalDeMinions() + self.plusDanioMasAlto()
	
	method cantidadTotalDeMinions() = oleadaMinions.sum({o => o.cantidadDeMinios()})
	
	method plusDanioMasAlto() = oleadaMinions.max({o => o.plusDanio()})
	
	override method batallarContra(campeon){
		if(oleadaMinions.size() == 1){
			super(campeon)
		}else{
			oleadaMinions.forEach({o => o.efectoOleadaBatallaCon(campeon)})
		}
	}
}
