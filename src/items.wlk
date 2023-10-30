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
	
	method condicionAdicionalSumaVida(unCampeon)
	
	method condicionaAdicionalAtaque(unCampeon)
}

class AnilloDeDoran inherits Item{
	
	override method condicionAdicionalSumaVida(unCampeon) = 60
	
	override method condicionaAdicionalAtaque(unCampeon) = 15
}

class TomoAmplificador inherits Item{
	
	override method condicionAdicionalSumaVida(unCampeon) = 
	unCampeon.acumuladoDeDanio() * 0.25
	
	override method condicionaAdicionalAtaque(unCampeon) = unCampeon.puntosDeAtaque() * 0.1
}

class SombreroDeRabadon inherits TomoAmplificador{
	override method condicionAdicionalSumaVida(unCampeon) = super(unCampeon) * 2
	
	override method condicionaAdicionalAtaque(unCampeon) = super(unCampeon) + 2
}