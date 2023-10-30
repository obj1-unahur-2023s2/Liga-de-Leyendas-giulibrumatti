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
	
	method cantidadTotalDeAtaque() = puntosDeAtaque + self.totalPuntosDeAtaquePorItems()
	
	method totalVidaPorItems() = items.sum({i => i.puntosDeVidaQueOtorga(self)})
	
	method totalPuntosDeAtaquePorItems() = items.sum({i => i.puntosDeAtaqueQueOtorga(self)})
	
	method obtenerPuntosDeDanioAcumulados(enBatalla){
		acumuladoDeDanio += enBatalla.puntosDeDanioAcumuladosCampeon()
	}
	
	method equiparItem(unItem){
		items.add(unItem)
	}
}
