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
	var universidad = "uba"
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() { return universidad.provinciaDondeEsta() }
	method honorariosPorHora() { return universidad.honorariosPorHoraDeTrabajo() }
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad = "uade"
	var provincia = "Bs As"
	var costo = 500
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() { return provincia }
	method provinciasDondePuedeTrabajar(prov) { provincia = prov }
	method honorariosPorHora(cantidad) { costo = cantidad }
	method honorariosPorHora() { return costo }
}

class Universidad {
	var provincia = "Bs As"
	var costo = 400
	method provinciaDondeEsta() { return provincia }
	method provinciaDondeEsta(lugar) { provincia = lugar }
	method honorariosPorHoraDeTrabajo() { return costo }
	method honorariosPorHoraDeTrabajo(cantidad) { costo = cantidad }
}


