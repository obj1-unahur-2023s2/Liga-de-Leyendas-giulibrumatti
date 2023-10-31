import batallas.*
import items.*

class Campeon {
	var puntosDeVida
	var puntosDeAtaque
	const property items = []
	var property unidadesBloqueo
	var property puntosDanio = 0
	
	method puntosDeVida() = puntosDeVida
	
	method puntosDeAtaque() = puntosDeAtaque
	
	method estaMuerto() = puntosDanio >=  self.cantidadTotalDeVida()
	
	method cantidadTotalDeVida() = puntosDeVida + self.totalVidaPorItems()
	
	method cantidadTotalDeAtaque() = puntosDeAtaque + self.totalAtaquesPorItems()
	
	method totalVidaPorItems() = items.sum({i => i.puntosDeVidaQueOtorga(self)})
	
	method totalAtaquesPorItems() = items.sum({i => i.puntosDeAtaqueQueOtorga(self)})
	
	method batallarContra(minions){
		if(unidadesBloqueo > 0){
			puntosDanio += minions.danioProducido()
			unidadesBloqueo = 0.max(unidadesBloqueo-1)
		}else{
			puntosDanio += minions.danioProducido() + 40
		}
	}
	
	method equiparItem(unItem){
		items.add(unItem)
	}
	
	method desequiparItem(unItem){
		items.remove(unItem)
	}
	
	method itemConMasPuntosDeVida() = items.max({i => i.puntosDeVidaQueOtorga(self)})

	method itemsQueAportanMasAtaqueQueVida() = items.filter({i => i.puntosDeAtaqueQueOtorga(self) > i.puntosDeVidaQueOtorga(self)})
	
	method hayItemConMas70DeVidaOMas30Ataque() = items.any({i => i.puntosDeVidaQueOtorga(self) > 70 || i.puntosDeAtaqueQueOtorga(self) > 30})

	method listaDePesosItems() = items.map({i => i.peso()})
	
	method itemsPesoMenosDe300() = items.count({i => i.peso() <= 300})
	
}
