

class Profesional{/*SUPER CLASE */
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() {return #{}}
	method honorariosPorHora() {return #{}}
	method trabajarEn (_provincia) {return self.provinciasDondePuedeTrabajar().contains(_provincia)}
	
}

/*se utiliza la herencia cuando hay una relacion entre*/
/*los metodos que utilizan ciertas clases relacionadas*/
class ProfesionalAsociado inherits Profesional {
	
	override method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	override method honorariosPorHora() { return 3000 }
}

/*se utiliza la herencia cuando hay una relacion entre*/
/*los metodos que utilizan ciertas clases relacionadas*/
class ProfesionalVinculado inherits Profesional {
	var provincia
	var honorario
	
	method setProvinciasDondePuedeTrabajar() {
		provincia = #{universidad.provinciaRecomendados()}
	}
	
	override method provinciasDondePuedeTrabajar() { 
		return provincia
	} 
	method setHonorariosPorHora() {
		honorario = universidad.honorariosRecomendados()
	}
	override method honorariosPorHora() {
		return  honorario
	} 
	
	method cobro() {
		honorario = honorario / 2 
		return 0
	}
}

/*se utiliza la herencia cuando hay una relacion entre*/
/*los metodos que utilizan ciertas clases relacionadas*/
class ProfesionalLibre inherits Profesional {
	var provincia =  #{}
	var honorario
	
	override method provinciasDondePuedeTrabajar() {
		return provincia
	}
	method addProvinciasDondePuedeTrabajar(_provincia) {
		provincia.addAll(_provincia )
	}
	override method honorariosPorHora() {
		return honorario
	}
	method setHonorariosPorHora(_honorario) { 
		honorario = _honorario
	}
	method cobro() { return honorario }
	method pasar(profesional,monto) { 
	self.honorariosPorHora() - monto
	return 	profesional.honorariosPorHora() + monto
		
	}
} 


class Universidades {
	var provincia
	var horarios 
	
    method provinciaRecomendados() {return provincia}
    method addProvinciaRecomendados(_provincia) {provincia = _provincia}
    
	method honorariosRecomendados() {return horarios}
	method setHonorariosRecomendados(_horarios) {horarios = _horarios}
} 



