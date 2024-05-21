// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad 
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
	method provinciasDondePuedeTrabajar() { return universidad.provinciaDondeEsta().asSet() }
	method honorariosPorHora() { return universidad.honorariosPorHoraDeTrabajo() }
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad 
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
	method contratar(profesional){ contratados.add(profesional) }
	method contratados(){ return contratados}
	method cuantosEstudiaronEn(universidad){ 
		return contratados.count({profesional => profesional.universidad() == universidad})
	} 
	method profesionalesCaros(){
		return contratados.filter({profesional => profesional.honorariosPorHora() > costo})	
	}
	method universidadesFormadoras(){
		return contratados.map({profesional => profesional.universidad()}).asList()
	}
	method profesionalMasBarato(){
		return contratados.min({profesional => profesional.honorariosPorHora()})
	}
	method genteAcotada(){
	    return contratados.all({profesional => profesional.provinciasDondePuedeTrabajar().size() <= 3}) 
	}
	method puedeSatisfacer(persona){
		return contratados.any({profesional => persona.puedeSerAtendidoPor(profesional)})
	}
}

class Persona {
	var lugar
	method viveEnProvincia(prov){ lugar = prov }
	method viveEnProvincia(){ return lugar }
	method puedeSerAtendidoPor(profesional){ return profesional.provinciaDondePuedeTrabajar().contains(lugar) }
}

