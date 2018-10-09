import profesionales.*

class Empresa { 
	const profesionales = #{} 
	var honorario
	method honorariosReferencia() {return honorario}
	method setHonorariosReferencia(num) {honorario = num}
	
	method agregarProfesionales( _profesional ) { profesionales.addAll( _profesional ) }
	method agregarProfesional(_profesional) { profesionales.add(_profesional) }
			  
	method profesionalesCaros() { return profesionales.filter( {
		profesional => profesional.honorariosPorHora() > honorario } ) }
	
	method universidadesFormadoras() {profesionales.map({
		profecional => profecional.universidad()}) }/*yo habia puesto find */
	
	method masBarato() { return profesionales.min({
		profecional => profecional.honorariosPorHora()})}

	method provinciaEstaCubierta(provincia) { return profesionales.any({
 		p => p.provinciasDondePuedeTrabajar().contains( provincia )} )
 		}
		/*aqui use find que devuelve el objeto, any es mas conbeniente ( devuelve true o false) */
	
	method cuantos(_universidad) { return profesionales.count({
		profecional => profecional.universidad() == _universidad})
		} /*habia usado sum */
		
	method pocoAtractivo() { profesionales.provinciasDondePuedeTrabajar().all({
		prov => profesionales.any({p=> p.provinciasDondePuedeTrabajar().contains(prov)}) and 
		p.honorariosPorHora() < profesionales.honorariosPorHora() }) 
		
}
	method profesionalMasBaratoQue( provincia , honorarios ) { return 
		profesionales.any({ p => p.provinciasDondePuedeTrabajar().contains(provincia) and p.honorariosPorHora() } ) 
	}

	method pocoAtractivo2(profesionales_) {return profesionales_.provinciasDondePuedeTrabajar().all({
		prov => self.profesionalMasBaratoQue(prov,profesionales_.honorariosPorHora())})}
	
	}