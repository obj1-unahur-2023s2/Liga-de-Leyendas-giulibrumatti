import campeones.*
import oleadasDeMinions.*

class Batalla {
	var campeon
	var oleadaDeMinions
	var batallas = 0
	
	method batallar(){
		if(batallas > 0){
			self.error("Esta batalla ya finalizo")
		}
		campeon.batallarContra(oleadaDeMinions)
		oleadaDeMinions.batallarContra(campeon)
		batallas++
	}
	
}
