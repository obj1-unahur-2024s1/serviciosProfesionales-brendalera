// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad = "unaHur"
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	method honorariosPorHora() { return 3000 }
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad 
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar(univ) { return univ.provinciaDondeEsta().asList() }
	method honorariosPorHora(univ) { return univ.honorariosPorHoraDeTrabajo() }
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad = "uade"
	const provincia = #{}
	var costo = 500
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() { return provincia }
	method provinciasDondePuedeTrabajar(prov) { provincia.add(prov) }
	method honorariosPorHora(cantidad) { costo = cantidad }
	method honorariosPorHora() { return costo }
}

class Universidad {
	const provincia = #{}
	var costo = 400
	method provinciaDondeEsta() { return provincia }
	method provinciaDondeEsta(lugar) { provincia.add(lugar) }
	method honorariosPorHoraDeTrabajo() { return costo }
	method honorariosPorHoraDeTrabajo(cantidad) { costo = cantidad }
}

class Empresa {
	var costo = 0
	const contratados = []
	method honorario(cant){ costo = cant }
	method honorario(){ return costo }
	method contratarProfesional(profesional){ contratados.add(profesional) }
	method cuantosEstudiaronEn(universidad){ 
		return contratados.count({profesional => profesional.universidad() == universidad})
	} 
	method profesionalesCaros(){
		return contratados.filter({profesional => profesional.honorariosPorHora() > costo})	
	}
	method universidadesFormadoras(){
		return contratados.map({profesional => profesional.universidad()}).asSet()
	}
	method profesionalMasBarato(){
		return contratados.min({profesional => profesional.honorariosPorHora()})
	}
	method genteAcotada(){
		return contratados.all({profesional => not profesional.provinciasDondePuedeTrabajar().size() > 3})
	}
}


