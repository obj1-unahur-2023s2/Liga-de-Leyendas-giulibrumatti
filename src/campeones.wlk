import batallas.*
import items.*

class Campeon {
	var puntosDeVida
	var puntosDeAtaque
	const property items = []
	var acumuladoDeDanio = 0
	
	method puntosDeVida() = puntosDeVida
	
	method puntosDeAtaque() = puntosDeAtaque
	
	method acumuladoDeDanio() = acumuladoDeDanio
	
	method estaMuerto() = acumuladoDeDanio >=  self.cantidadTotalDeVida()
	
	method cantidadTotalDeVida() = puntosDeVida + self.totalVidaPorItems()
	
	method cantidadTotalDeAtaque() =  self.totalAtaquesPorItems()
	
	method totalVidaPorItems() = items.sum({i => i.puntosDeVidaQueOtorga(self)})
	
	method totalAtaquesPorItems() = items.sum({i => i.puntosDeAtaqueQueOtorga(self)})
	
	method aplicarDaniosAcumulados(enBatalla){
		acumuladoDeDanio += enBatalla.puntosDeDanioAcumuladosCampeon()
	}
	
	method equiparItem(unItem){
		items.add(unItem)
	}
}
