import campeones.*

class Item{
	var peso
	
	method puntosDeVidaQueOtorga(unCampeon){
		if(peso < 500){
			return 20 + self.condicionAdicionalSumaVida(unCampeon)
		}else{
			return 40 + self.condicionAdicionalSumaVida(unCampeon)
		}
	}
	
	method puntosDeAtaqueQueOtorga(unCampeon){
		if(peso < 500){
			return 10 + self.condicionaAdicionalAtaque(unCampeon)
		}else{
			return 5 + self.condicionaAdicionalAtaque(unCampeon)
		}
	}
	
	method peso() = peso
	
	method condicionAdicionalSumaVida(unCampeon)
	
	method condicionaAdicionalAtaque(unCampeon)
	
	method efectoEquiparA(unCampeon)
	
	method efectoDesequiparA(unCampeon)
	

}

class AnilloDeDoran inherits Item{
	
	override method condicionAdicionalSumaVida(unCampeon) = 60
	
	override method condicionaAdicionalAtaque(unCampeon) = 15
	
	override method efectoEquiparA(unCampeon){
		unCampeon.puntosDanio(unCampeon.puntosDanio() + 5)
	}
	
	override method efectoDesequiparA(unCampeon){
		unCampeon.puntosDanio(0.max(unCampeon.puntosDanio() - 10))
	}
}

class TomoAmplificador inherits Item{
	
	override method condicionAdicionalSumaVida(unCampeon) = 
	unCampeon.puntosDanio() * 0.25
	
	override method condicionaAdicionalAtaque(unCampeon) = 
	unCampeon.puntosDanio() * 0.1
	
	override method efectoEquiparA(unCampeon){
		unCampeon.unidadesBloqueo(unCampeon.unidadesBloqueo() + 2)
	}
	
	override method efectoDesequiparA(unCampeon){
		unCampeon.puntosDanio(unCampeon.puntosDanio() + 30)
	}
	
}

class SombreroDeRabadon inherits TomoAmplificador{
	override method condicionAdicionalSumaVida(unCampeon) = super(unCampeon) * 2
	
	override method condicionaAdicionalAtaque(unCampeon) = super(unCampeon) + 2
	
	override method efectoEquiparA(unCampeon){
		super(unCampeon)
		unCampeon.puntosDanio(unCampeon.puntosDanio() + 10)
	}
	
	override method efectoDesequiparA(unCampeon){}
}

class BastonDelVacio inherits Item{
	const property items = []
	
	override method efectoEquiparA(unCampeon){}
	
	override method efectoDesequiparA(unCampeon){}
	
	override method puntosDeVidaQueOtorga(unCampeon) = items.sum({i => i.puntosDeVidaQueOtorga(unCampeon)}) + peso
	
	override method puntosDeAtaqueQueOtorga(unCampeon) = items.sum({i => i.puntosDeAtaqueQueOtorga(unCampeon)}) + peso
}