!classDefinition: #DetectiveTest category: 'TrabajoFinal-Entrega-Grupo2'!
TestCase subclass: #DetectiveTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!DetectiveTest methodsFor: 'DetectiveTest' stamp: 'DJVANP 12/7/2020 11:47:46'!
test001_cuandoUnDetectiveSeEncuentraEnArgentina

	| detectiveClasico |
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory argentina .

	
	Assert that: detectiveClasico ubicacion isEqualTo: factory argentina.! !

!DetectiveTest methodsFor: 'DetectiveTest' stamp: 'DJVANP 12/7/2020 11:47:52'!
test002_cuandoUnDetectiveSeEncuentraEnColombia

	| detectiveClasico|
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory colombia.

	
	Assert that: detectiveClasico ubicacion isEqualTo: factory colombia .! !

!DetectiveTest methodsFor: 'DetectiveTest' stamp: 'DJVANP 12/7/2020 11:47:57'!
test003_unDetectiveNoPuedeInterrogarAUnTestigoQueNoSeEncuentreEnSuPaisDeUbicacion

	| detectiveClasico unTestigo|
	
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory colombia.
	
	unTestigo _ Testigo conUbicacion: factory argentina .

	Assert should: [detectiveClasico interrogarPorAspectoA: unTestigo] signal: Error withDescription: detectiveClasico errorDistintoPais .! !

!DetectiveTest methodsFor: 'DetectiveTest' stamp: 'DJVANP 12/7/2020 11:48:07'!
test004_cuandoUnDetectiveViaja_suUbicacionCambiaAlPaisDestino

	| detectiveClasico|
	
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory colombia.
	
	detectiveClasico viajarA: factory argentina.

	
	Assert that: detectiveClasico ubicacion isEqualTo: factory argentina .! !

!DetectiveTest methodsFor: 'DetectiveTest' stamp: 'DJVANP 12/7/2020 11:48:12'!
test005_cuandoUnDetectiveQuiereViajarAlMismoPaisDondeSeUbica_NoViaja

	| detectiveClasico|
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory chile.
	
	Assert should: [detectiveClasico viajarA: factory chile] signal: Error withDescription: detectiveClasico errorMismoPais.
	Assert that: detectiveClasico ubicacion isEqualTo: factory chile.! !

!DetectiveTest methodsFor: 'DetectiveTest' stamp: 'DJVANP 12/7/2020 11:48:16'!
test006_cuandoUnDetectiveTieneUnaLibretaParaAnotarPistas

	| detectiveClasico|
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico asignarLibreta: factory libretaDetective.
	
	Assert that: detectiveClasico libreta isEqualTo: factory libretaDetective.
! !

!DetectiveTest methodsFor: 'DetectiveTest' stamp: 'DJVANP 12/7/2020 11:52:10'!
test007_cuandoUnDetectiveObtieneUnaPista_filtraDeSuListaDeSospechososAquellosQueNoCoicidenConLaPista

	| detectiveClasico unTestigo|
	
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory argentina.
	detectiveClasico asignarLibreta: factory libretaDetective.
	
	unTestigo _ factory testigoArgentina1.
	unTestigo agregarPistaDeRutaDe: factory chile.
	unTestigo agregarPistasDeAspecto: factory peloGris.
	unTestigo agregarPistasDeAspecto: factory peloCorto.
	
	detectiveClasico interrogarPorAspectoA: unTestigo.
	
	Assert that: detectiveClasico cantidadDeSospechososEnLibreta isEqualTo: 1.! !


!DetectiveTest methodsFor: 'DetectiveClasicoTest' stamp: 'DJVANP 11/29/2020 19:31:16'!
test001_aUnDetectiveClasico_LeLleva2HorasInterrogarAUnTestigo

	| detectiveClasico |
	
	detectiveClasico _ DetectiveClasico new.
	
	Assert that: detectiveClasico tiempoDeInterrogacion isEqualTo: 2*hour.! !

!DetectiveTest methodsFor: 'DetectiveClasicoTest' stamp: 'DJVANP 11/29/2020 21:58:10'!
test002_unDetectiveClasicoDemora10HorasEnViajarAUnPaisNoLimitrofe

	| detectiveClasico |
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory colombia.

	Assert that: (detectiveClasico tiempoDeVueloHacia: factory argentina) isEqualTo: 10*hour.! !

!DetectiveTest methodsFor: 'DetectiveClasicoTest' stamp: 'DJVANP 11/29/2020 21:58:16'!
test003_unDetectiveClasicoDemora5HorasEnViajarAUnPaisLimitrofe

	| detectiveClasico |
	
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory argentina. 

	Assert that: (detectiveClasico tiempoDeVueloHacia: factory chile) isEqualTo: 5*hour
! !

!DetectiveTest methodsFor: 'DetectiveClasicoTest' stamp: 'DJVANP 12/7/2020 12:09:05'!
test004_unDetectiveClasicoInterrogaSobreElAspectoAUnTestigoConPista_anotaLaPistaEnLaLibreta

	| detectiveClasico unTestigo unCriminal|
	
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory argentina.
	detectiveClasico asignarLibreta: factory libretaDetective.

	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: factory rutaDeEscape1.
	unTestigo _	 factory testigoArgentina1. 
	
	detectiveClasico interrogarPorAspectoA: unTestigo.

	Assert that: detectiveClasico cantidadDePistasDeAspecto isEqualTo: 1! !

!DetectiveTest methodsFor: 'DetectiveClasicoTest' stamp: 'DJVANP 12/7/2020 12:07:48'!
test005_unDetectiveClasicoInterrogaSobreElAspectoAUnTestigoSinPista_noTieneNadaParaAnotar

	| detectiveClasico unTestigo unCriminal|
	
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory chile.
	detectiveClasico asignarLibreta: factory libretaDetective.
	
	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: {factory peru. factory colombia}.
	
	unTestigo _	 factory testigoChile1 .
	
	detectiveClasico interrogarPorAspectoA: unTestigo.

	Assert that: detectiveClasico cantidadDePistasDeAspecto isEqualTo: 0.
! !

!DetectiveTest methodsFor: 'DetectiveClasicoTest' stamp: 'DJVANP 12/7/2020 12:58:25'!
test006_unDetectiveClasicoInterrogaSobreElPaisAUnTestigoConPista_AnotaEsePaisComoElSiguieteEnViajar

	| detectiveClasico unTestigo unCriminal|
	
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory argentina.
	detectiveClasico asignarLibreta: factory libretaDetective.
	
	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: {factory peru. factory colombia}.

	
	unTestigo _	 factory testigoArgentina1 .
	
	detectiveClasico interrogarPorPaisA: unTestigo.

	Assert that: detectiveClasico pistaDePaisDeCriminal isEqualTo: factory peru.

! !

!DetectiveTest methodsFor: 'DetectiveClasicoTest' stamp: 'DJVANP 12/7/2020 12:09:54'!
test007_unDetectiveClasicoInterrogaSobreElPaisAUnTestigoSinPista_noAnotaNada

	| detectiveClasico unTestigo unCriminal|
	
	detectiveClasico _ DetectiveClasico new.
	detectiveClasico ubicadoEn: factory chile.
	detectiveClasico asignarLibreta: factory libretaDetective.
	
	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: {factory peru. factory colombia}.

	
	unTestigo _	 factory testigoChile1 .
	
	detectiveClasico interrogarPorPaisA: unTestigo.

	Assert isFalse: (detectiveClasico tienePistasDePais).
! !


!DetectiveTest methodsFor: 'DetectiveInterpolTest' stamp: 'DJVANP 11/29/2020 21:57:11'!
test001_unDetectiveDeInterpolDemora8HorasEnVolarAUnPaisNoLimitrofe

	| detectiveInterpol |
	detectiveInterpol _ DetectiveInterpol new.
	detectiveInterpol ubicadoEn: factory argentina.

	
	Assert that: (detectiveInterpol tiempoDeVueloHacia: factory colombia) isEqualTo: 8*hour.

	! !

!DetectiveTest methodsFor: 'DetectiveInterpolTest' stamp: 'DJVANP 11/29/2020 21:59:53'!
test002_unDetectiveDeIntepolDemora4HorasEnVolarAUnPaisLimitrofe

	| detectiveInterpol |
	detectiveInterpol _ DetectiveInterpol new.
	detectiveInterpol ubicadoEn: factory argentina.
	
	Assert that: (detectiveInterpol tiempoDeVueloHacia: factory chile) isEqualTo: 4*hour.

	! !

!DetectiveTest methodsFor: 'DetectiveInterpolTest' stamp: 'DJVANP 11/29/2020 19:32:41'!
test003_unDetectiveDeIntepolDemora2HorasEnInterrogarAUnTestigo

	| detectiveInterpol |
	detectiveInterpol _ DetectiveInterpol new.
	
	Assert that: detectiveInterpol tiempoDeInterrogacion isEqualTo: 2*hour.

	! !

!DetectiveTest methodsFor: 'DetectiveInterpolTest' stamp: 'DJVANP 12/7/2020 12:10:32'!
test004_unDetectiveDeInterpolInterrogaSobreElAspectoAUnTestigoConPista_anotaLaPistaEnLaLibreta

	| detectiveInterpol unTestigo unCriminal|
	
	detectiveInterpol _ DetectiveInterpol new.
	detectiveInterpol ubicadoEn: factory argentina.
	detectiveInterpol asignarLibreta: factory libretaDetective.

	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: factory rutaDeEscape1.
	unTestigo _	 factory testigoArgentina1. 
	
	detectiveInterpol interrogarPorAspectoA: unTestigo.

	Assert that: detectiveInterpol cantidadDePistasDeAspecto isEqualTo: 1! !

!DetectiveTest methodsFor: 'DetectiveInterpolTest' stamp: 'DJVANP 12/7/2020 12:13:19'!
test005_unDetectiveInterpolInterrogaSobreElAspectoAUnTestigoSinPista_noTieneNadaParaAnotar

	| detectiveInterpol unTestigo unCriminal|
	
	detectiveInterpol _ DetectiveClasico new.
	detectiveInterpol ubicadoEn: factory chile.
	detectiveInterpol asignarLibreta: factory libretaDetective.
	
	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: {factory peru. factory colombia}.
	
	unTestigo _	 factory testigoChile1 .
	
	detectiveInterpol interrogarPorAspectoA: unTestigo.

	Assert that: detectiveInterpol cantidadDePistasDeAspecto isEqualTo: 0.! !

!DetectiveTest methodsFor: 'DetectiveInterpolTest' stamp: 'DJVANP 12/7/2020 12:59:17'!
test006_unDetectiveInterpolInterrogaSobreElPaisAUnTestigoConPista_AnotaEsePaisComoElSiguieteEnViajar

	| detectiveInterpol unTestigo unCriminal|
	
	detectiveInterpol _ DetectiveInterpol new.
	detectiveInterpol ubicadoEn: factory argentina.
	detectiveInterpol asignarLibreta: factory libretaDetective.
	
	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: {factory peru. factory colombia}.

	
	unTestigo _	 factory testigoArgentina1 .
	
	detectiveInterpol interrogarPorPaisA: unTestigo.

	Assert that: detectiveInterpol pistaDePaisDeCriminal isEqualTo: factory peru.! !

!DetectiveTest methodsFor: 'DetectiveInterpolTest' stamp: 'DJVANP 12/7/2020 12:59:10'!
test007_unDetectiveInterpolInterrogaSobreElPaisAUnTestigoConSinPista_noAnotaNada

	| detectiveInterpol unTestigo unCriminal|
	
	detectiveInterpol _ DetectiveInterpol new.
	detectiveInterpol ubicadoEn: factory chile.
	detectiveInterpol asignarLibreta: factory libretaDetective.
	
	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: {factory peru. factory colombia}.

	unTestigo _	 factory testigoChile1 .
	detectiveInterpol interrogarPorPaisA: unTestigo.

	Assert that: detectiveInterpol pistaDePaisDeCriminal isEqualTo: nil.
! !


!DetectiveTest methodsFor: 'setUp' stamp: 'DJVANP 12/3/2020 22:24:37'!
setUp 

	factory _ FactoryObject new.
	
	
	
	
	
	! !


!DetectiveTest methodsFor: 'DetectivePersuasivoTest' stamp: 'DJVANP 11/29/2020 21:58:28'!
test001_unDetectivePersuasivoDemora10HorasEnVolarAUnPaisNoLimitrofe

	| detectivePersuasivo |
	detectivePersuasivo _ DetectivePersuasivo new.
	detectivePersuasivo ubicadoEn: factory argentina.
	
	Assert that: (detectivePersuasivo tiempoDeVueloHacia: factory colombia) isEqualTo: 10*hour.! !

!DetectiveTest methodsFor: 'DetectivePersuasivoTest' stamp: 'DJVANP 11/29/2020 21:58:34'!
test002_unDetectivePersuasivoDemora5HorasEnVolarAUnPaisLimitrofe

	| detectivePersuasivo |
	detectivePersuasivo _ DetectivePersuasivo new.
	detectivePersuasivo ubicadoEn: factory argentina. 
	
	Assert that: (detectivePersuasivo tiempoDeVueloHacia: factory chile) isEqualTo: 5*hour.! !

!DetectiveTest methodsFor: 'DetectivePersuasivoTest' stamp: 'DJVANP 11/29/2020 19:32:16'!
test003_unDetectivePersuasivoDemora1HoraEnInterrogarAUnTestigo

	| detectivePersuasivo |
	detectivePersuasivo _ DetectivePersuasivo new.
	
	Assert that: detectivePersuasivo tiempoDeInterrogacion isEqualTo: 1*hour.! !

!DetectiveTest methodsFor: 'DetectivePersuasivoTest' stamp: 'DJVANP 12/7/2020 12:12:24'!
test004_unDetectivePersuasivoInterrogaSobreElAspectoAUnTestigoConPista_anotaDosPistasEnLaLibreta

	| detectivePersuasivo unTestigo unCriminal|
	
	detectivePersuasivo _ DetectivePersuasivo new.
	detectivePersuasivo ubicadoEn: factory argentina.
	detectivePersuasivo asignarLibreta: factory libretaDetective.

	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: factory rutaDeEscape1.
	unTestigo _	 factory testigoArgentina1. 
	
	detectivePersuasivo interrogarPorAspectoA: unTestigo.

	Assert that: detectivePersuasivo cantidadDePistasDeAspecto isEqualTo: 2.! !

!DetectiveTest methodsFor: 'DetectivePersuasivoTest' stamp: 'DJVANP 12/7/2020 12:13:54'!
test005_unDetectivePersuasivoSobreElAspectoAUnTestigoSinPista_noTieneNadaParaAnotar

	| detectivePersuasivo unTestigo unCriminal|
	
	detectivePersuasivo _ DetectivePersuasivo new.
	detectivePersuasivo ubicadoEn: factory chile.
	detectivePersuasivo asignarLibreta: factory libretaDetective.
	
	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: {factory peru. factory colombia}.
	
	unTestigo _	 factory testigoChile1 .
	
	detectivePersuasivo interrogarPorAspectoA: unTestigo.

	Assert that: detectivePersuasivo cantidadDePistasDeAspecto isEqualTo: 0.! !

!DetectiveTest methodsFor: 'DetectivePersuasivoTest' stamp: 'DJVANP 12/7/2020 12:59:46'!
test006_unDetectivePersuasivoInterrogaSobreElPaisAUnTestigoConPista_AnotaEsePaisComoElSiguieteEnViajar

	| detectivePersuasivo unTestigo unCriminal|
	
	detectivePersuasivo _ DetectivePersuasivo new.
	detectivePersuasivo ubicadoEn: factory argentina.
	detectivePersuasivo asignarLibreta: factory libretaDetective.
	
	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: {factory peru. factory colombia}.

	
	unTestigo _	 factory testigoArgentina1 .
	
	detectivePersuasivo interrogarPorPaisA: unTestigo.

	Assert that: detectivePersuasivo pistaDePaisDeCriminal isEqualTo: factory peru.
! !

!DetectiveTest methodsFor: 'DetectivePersuasivoTest' stamp: 'DJVANP 12/7/2020 13:00:12'!
test007_unDetectivePersuasivoInterrogaSobreElPaisAUnTestigoConSinPista_noAnotaNada

	| detectivePersuasivo unTestigo unCriminal|
	
	detectivePersuasivo _ DetectivePersuasivo new.
	detectivePersuasivo ubicadoEn: factory chile.
	detectivePersuasivo asignarLibreta: factory libretaDetective.
	
	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: {factory peru. factory colombia}.

	unTestigo _	 factory testigoChile1 .
	detectivePersuasivo interrogarPorPaisA: unTestigo.

	Assert that: detectivePersuasivo pistaDePaisDeCriminal isEqualTo: nil.! !

!DetectiveTest methodsFor: 'DetectivePersuasivoTest' stamp: 'DJVANP 12/7/2020 13:00:31'!
test008_unDetectivePersuasivoInterrogaSobreElPaisAUnTestigoConConPista_anotaUnaPistaDePaisYUnaPistaDeAspecto

	| detectivePersuasivo unTestigo unCriminal|
	
	detectivePersuasivo _ DetectivePersuasivo new.
	detectivePersuasivo ubicadoEn: factory argentina.
	detectivePersuasivo asignarLibreta: factory libretaDetective.
	
	unCriminal _ factory smithers.
	unCriminal robarObjetoA: factory argentina.
	unCriminal escaparPorRuta: {factory peru. factory colombia}.

	
	unTestigo _	 factory testigoArgentina1 .
	
	detectivePersuasivo interrogarPorPaisA: unTestigo.

	Assert that: detectivePersuasivo pistaDePaisDeCriminal isEqualTo: factory peru.
	Assert that: detectivePersuasivo cantidadDePistasDeAspecto isEqualTo: 1.
	! !


!classDefinition: #LibretaDeDetectiveTest category: 'TrabajoFinal-Entrega-Grupo2'!
TestCase subclass: #LibretaDeDetectiveTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!LibretaDeDetectiveTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 11:04:24'!
setUp
	
	factory _ FactoryObject new.
	
	

	
	
	

	! !

!LibretaDeDetectiveTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:17:58'!
test001_cuandoUnaLibretaDeDetectiveNoTienePaisesDondePuedeSePuedeViajar

	| unaLibreta |
	unaLibreta _ LibretaDeDetective conPaisesConocidos: {} ySospechosos: {}.
	
	Assert isFalse: (unaLibreta tienePaisesConocidos).

	

	! !

!LibretaDeDetectiveTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:23:22'!
test002_cuandoUnaLibretaDeDetectiveTieneAlMenosUnPaiseDondePuedeSePuedeViajar

	| unaLibreta |
	unaLibreta _ LibretaDeDetective conPaisesConocidos: factory listaDePaises1 ySospechosos: {}.

	Assert isTrue: (unaLibreta tienePaisesConocidos).

	

	! !

!LibretaDeDetectiveTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:19:50'!
test003_unLibretaDeDetectiveNoGuardaPaisesRepetidos

	| unaLibreta |
	unaLibreta _ LibretaDeDetective conPaisesConocidos: factory listaDePaises2 ySospechosos: {}.

	Assert that: unaLibreta cantidadDePaisesConocidos isEqualTo: 3.

	

	! !

!LibretaDeDetectiveTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:22:51'!
test004_unLibretaDeDetectiveNoTieneSospechosos

	| unaLibreta |
	unaLibreta _ LibretaDeDetective conPaisesConocidos: factory listaDePaises1 ySospechosos: {}.

	Assert isFalse: (unaLibreta tieneSospechososEnLaLista ).

	

	! !

!LibretaDeDetectiveTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:23:47'!
test005_unLibretaDeDetectiveTieneAlMenosUnSospechoso

	| unaLibreta |
	unaLibreta _ LibretaDeDetective conPaisesConocidos: factory listaDePaises1 ySospechosos: factory listaDeSospechosos1 .

	Assert isTrue: (unaLibreta tieneSospechososEnLaLista ).

	

	! !

!LibretaDeDetectiveTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:24:53'!
test006_unLibretaDeDetectiveNoGuardaSospechososRepetidos

	| unaLibreta |
	unaLibreta _ LibretaDeDetective conPaisesConocidos: factory listaDePaises1 ySospechosos: factory listaDeSospechosos2 .

	Assert that: unaLibreta cantidadDeSospechosos isEqualTo: 2.

	

	! !

!LibretaDeDetectiveTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 00:56:38'!
test007_unLibretaDeDetectiveIniciaSinPistasSobreElAspectoDelCriminal

	| unaLibreta |
	unaLibreta _ LibretaDeDetective conPaisesConocidos: factory listaDePaises1 ySospechosos: factory listaDeSospechosos2 .

	Assert isFalse: (unaLibreta tienePistasAspectoCriminal ).

	

	! !


!classDefinition: #PaisesTest category: 'TrabajoFinal-Entrega-Grupo2'!
TestCase subclass: #PaisesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/28/2020 13:39:03'!
test001_cuandoUnPaisSeLlamaArgentina 

	
	| unPais |
	unPais _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 0*hour.
	
	Assert that: unPais nombre isEqualTo: 'Argentina'.! !

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/28/2020 13:39:14'!
test002_cuandoUnPaisSeLlamaColombia

	
	| unPais |
	unPais _ Pais conNombre: 'Colombia' yTiempoDeEsperaEnMigraciones: 0*hour.

	Assert that: unPais nombre isEqualTo: 'Colombia'.! !

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 01:10:32'!
test003_cuandoUnPaisNoTieneHorasDeEsperaEnMigraciones

	
	| unPais |
	unPais _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 0*hour.

	Assert that: unPais tiempoDeEsperaEnMigraciones isEqualTo: 0*hour.! !

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 01:10:37'!
test004_cuandoUnPaisTiene2HorasDeEsperaEnMigraciones

	
	| unPais |
	unPais _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 2*hour.

	Assert that: unPais tiempoDeEsperaEnMigraciones isEqualTo: 2*hour.! !

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 01:10:43'!
test005_cuandoUnPaisNoTienePaisesLimitrofes

	
	| unPais|
	unPais _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 2*hour.

	Assert isFalse: (unPais tienePaisesLimitrofes).! !

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 01:10:46'!
test006_cuandoUnPaisLimitaConOtroPais
	
	| unPais otroPais|
	unPais _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 2*hour.
	otroPais _ Pais conNombre: 'Chile' yTiempoDeEsperaEnMigraciones: 1*hour. 
	
	unPais limitaCon: {otroPais}.

	Assert isTrue: (unPais tienePaisesLimitrofes).! !

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 01:10:50'!
test007_unPaisNoTienePaisesLimitrofesRepetidos
	
	| unPais chile peru|
	unPais _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 2*hour.
	chile _ Pais conNombre: 'Chile' yTiempoDeEsperaEnMigraciones: 1*hour. 
	peru _ Pais conNombre: 'Peru' yTiempoDeEsperaEnMigraciones: 3*hour. 
	
	unPais limitaCon: {chile. peru. chile}.
	Assert that: unPais cantidadDePaisesLimitrofes isEqualTo: 2.! !

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 01:10:55'!
test008_cuandoUnPaisLimitaConOtro_esePaisTambienLoAgregaComoLimitrofe
	
	| unPais chile|
	unPais _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 2*hour.
	chile _ Pais conNombre: 'Chile' yTiempoDeEsperaEnMigraciones: 1*hour. 
	
	unPais limitaCon: {chile}.
	
	Assert isTrue: (unPais esLimitrofeDe: chile).
	Assert isTrue: (chile esLimitrofeDe: unPais).! !

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 01:11:01'!
test009_cuandoUnPaisTieneUnObjetoDeValor
	
	| unPais |
	unPais _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 2*hour.
	
	Assert isTrue: (unPais tieneObjetoDeValor).
! !

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 01:11:05'!
test010_cuandoUnPaisEsObjetivoDeUnRobo_pierdeSuObjetoDeValor
	
	| unPais |
	unPais _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 2*hour.
	
	unPais esRobado.
	
	Assert isFalse: (unPais tieneObjetoDeValor).
! !

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 01:11:09'!
test011_cuandoUnPaisNoTieneTestigosEnSuTerritorio
	
	| unPais |
	unPais _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 2*hour.
	
	Assert isFalse: (unPais tieneTestigos).
! !

!PaisesTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 01:11:15'!
test012_cuandoUnPaisTieneAlMenosUnTestigoEnSuTerritorio
	
	| unPais unTestigo|
	unPais _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 2*hour.
	unTestigo _ Testigo conUbicacion: unPais.
	
	Assert isTrue: (unPais tieneTestigos ).
! !


!classDefinition: #PartidaCarmenSanDiegoTest category: 'TrabajoFinal-Entrega-Grupo2'!
TestCase subclass: #PartidaCarmenSanDiegoTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 10:45:13'!
setUp

	factory _ FactoryObject new.
	
	! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 16:33:52'!
test001_cuandoUnaPartidaDeCarmenSanDiegoNoTieneTiempoRestante

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 0*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico .
	
	Assert that: partidaCarmenSanDiego tiempoRestante isEqualTo: 0*hour.! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 16:33:37'!
test002_cuandoUnaPartidaDeCarmenSanDiegoLeQuedan100Horas

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveInterpol .
	
	Assert that: partidaCarmenSanDiego tiempoRestante isEqualTo: 100*hour.! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 16:34:07'!
test003_cuandoEnUnaPartidaDeCarmenSanDiegoHuboRoboEnArgentina

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico .
	
	Assert that: partidaCarmenSanDiego paisDelRobo isEqualTo: factory argentina.! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 16:34:19'!
test004_cuandoEnUnaPartidaDeCarmenSanDiegoElLadronEsSmithersYElPaisPierdeSuObjeto

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico .
		
	Assert that: partidaCarmenSanDiego ladron isEqualTo: factory smithers.
	Assert isTrue: (factory smithers esLadron).
	Assert isFalse: (factory argentina tieneObjetoDeValor).! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 16:34:44'!
test005_cuandoEnUnaPartidaDeCarmenSanDiegoTieneUnDetective

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico .
		
	Assert that: partidaCarmenSanDiego detective isEqualTo: factory detectiveClasico.
! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 16:34:57'!
test006_cuandoEnUnaPartidaDeCarmenSanDiegoTieneUnDetective_esteComienzaEnElPaisDelRobo

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectivePersuasivo .
		
	Assert that: partidaCarmenSanDiego ubicacionDeDetective isEqualTo: factory argentina.
! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 16:27:31'!
test007_enUnaPartidaDeCarmenSanDiego_cuandoUnDetectiveClasicoViajaAUnPaisNoLimitrofe_seUsan10HorasDePartidaMasElTiempoEnMigracionesDelPais

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico.
												
	partidaCarmenSanDiego detectiveViajaA: factory colombia.
		
	Assert that: partidaCarmenSanDiego tiempoRestante isEqualTo: 87*hour.
! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 16:28:47'!
test008_enUnaPartidaDeCarmenSanDiego_cuandoUnDetectiveClasicoViajaAUnPaisLimitrofe_seUsan5HorasDePartidaMasElTiempoEnMigracionesDelPais

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico.
												
	partidaCarmenSanDiego detectiveViajaA: factory chile.
		
	Assert that: partidaCarmenSanDiego tiempoRestante isEqualTo: 94*hour.
! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 16:28:59'!
test009_enUnaPartidaDeCarmenSanDiego_cuandoUnDetectiveInterpolViajaAUnPaisNoLimitrofe_seUsan8HorasDePartidaMasElTiempoEnMigracionesDelPais

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveInterpol .
												
	partidaCarmenSanDiego detectiveViajaA: factory colombia.
		
	Assert that: partidaCarmenSanDiego tiempoRestante isEqualTo: 89*hour.
! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 16:29:41'!
test010_enUnaPartidaDeCarmenSanDiego_cuandoUnDetectiveInterpolViajaAUnPaisLimitrofe_seUsan4HorasDePartidaMasElTiempoEnMigracionesDelPais

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveInterpol .
												
	partidaCarmenSanDiego detectiveViajaA: factory chile.
		
	Assert that: partidaCarmenSanDiego tiempoRestante isEqualTo: 95*hour.
! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 16:29:53'!
test011_enUnaPartidaDeCarmenSanDiego_cuandoNoQuedanHorasSufientesParaQueElDetectiveViaje_noViaja

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 5*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico .
												

	Assert should: [partidaCarmenSanDiego detectiveViajaA: factory colombia] 
			signal: Error withDescription: partidaCarmenSanDiego errorFaltaTiempoParaViajar.
	
	Assert that: partidaCarmenSanDiego tiempoRestante isEqualTo: 5*hour.
	Assert that: partidaCarmenSanDiego ubicacionDeDetective isEqualTo: factory argentina.
! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:26:22'!
test012_enUnaPartidaDeCarmenSanDiego_cuandoNoQuedanHorasSufientesParaQueElDetectiveInterroguePorAspecto_noInterroga

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 1*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico .
												
	partidaCarmenSanDiego alDetectiveSeLeAsignaUnaLibreta: factory libretaDetective.
												
	Assert should: [partidaCarmenSanDiego detectiveInterrogaPorAspectoA: factory testigoArgentina1] 
			signal: Error withDescription: partidaCarmenSanDiego errorFaltaTiempoParaInterrogar .
	
	Assert that: partidaCarmenSanDiego tiempoRestante isEqualTo: 1*hour.

! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:26:22'!
test013_enUnaPartidaDeCarmenSanDiego_cuandoNoQuedanHorasSufientesParaQueElDetectiveInterroguePorPais_noInterroga

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 1*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico.
	
	partidaCarmenSanDiego alDetectiveSeLeAsignaUnaLibreta: factory libretaDetective.
												
	Assert should: [partidaCarmenSanDiego detectiveInterrogaPorPaisA: factory testigoArgentina1 ] 
			signal: Error withDescription: partidaCarmenSanDiego errorFaltaTiempoParaInterrogar .
	
	Assert that: partidaCarmenSanDiego tiempoRestante isEqualTo: 1*hour.

! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/8/2020 10:12:52'!
test014_enUnaPartidaDeCarmenSanDiego_siQuedan0HorasSePierdeLaPartida

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectivePersuasivo .
	
	partidaCarmenSanDiego restarTiempo: 100*hour.

	Assert isTrue:(partidaCarmenSanDiego estaPerdida).

! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:57:00'!
test015_enUnaPartidaDeCarmenSanDiego_seEmiteUnaOrdenDeArrestoCuandoQuedaUnSoloSospechoso

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico.
												

	partidaCarmenSanDiego alDetectiveSeLeAsignaUnaLibreta: factory libretaDetectiveSospechosoUnico .
	
	partidaCarmenSanDiego detectiveEmiteOrdenDeArrestoEnPartida.
	partidaCarmenSanDiego copiarStreamEnArchivoDePrueba: factory archivoDePrueba.

	
	Assert that: partidaCarmenSanDiego contenidoDeStream isEqualTo: factory contenidoDeArchivoDePrueba .
	Assert that: partidaCarmenSanDiego tiempoRestante isEqualTo: 100*hour.! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:58:07'!
test016_enUnaPartidaDeCarmenSanDiego_sePierdeCuandoSeEmiteUnaOrdenDeArrestoTeniendoMasDeUnSospechoso

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico .
	
	partidaCarmenSanDiego alDetectiveSeLeAsignaUnaLibreta: factory libretaDetective.
	
	partidaCarmenSanDiego detectiveEmiteOrdenDeArrestoEnPartida.
	partidaCarmenSanDiego copiarStreamEnArchivoDePrueba: factory archivoDePrueba.

	Assert that: partidaCarmenSanDiego contenidoDeStream isEqualTo: factory contenidoDeArchivoDePrueba .
	Assert isTrue:(partidaCarmenSanDiego estaPerdida).

! !

!PartidaCarmenSanDiegoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:26:22'!
test017_enUnaPartidaDeCarmenSanDiego_noSePuedeGanarSiHayMasDeUnSospechosoRegistrado

	| partidaCarmenSanDiego |
	partidaCarmenSanDiego _ PartidaCarmenSanDiego empezarPartidaConHoras: 100*hour 
												enPais: factory argentina 
												robadoPor: factory smithers 
												conDetective: factory detectiveClasico .
	
	partidaCarmenSanDiego alDetectiveSeLeAsignaUnaLibreta: factory libretaDetective.
	
	Assert should:[partidaCarmenSanDiego ganarPartida] signal: Error withDescription: partidaCarmenSanDiego errorImposibleGanarPartidaAun.
	Assert isFalse: (partidaCarmenSanDiego estaPerdida).

! !


!classDefinition: #SospechosoTest category: 'TrabajoFinal-Entrega-Grupo2'!
TestCase subclass: #SospechosoTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 10:56:29'!
setUp 

	factory _ FactoryObject new.
	
! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:35:52'!
test001_cuandoElSospechosoSeLlamaSmithers

	| unSospechoso |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 

	Assert that: unSospechoso nombre isEqualTo: (factory nombreSmithers)! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:36:12'!
test002_cuandoElSospechosoTienePeloGris

	| unSospechoso |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
	
	Assert that: unSospechoso colorDePelo isEqualTo: (factory peloGris).! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:40:31'!
test003_cuandoElSospechosoTienePeloCorto

	| unSospechoso |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
	
	Assert that: unSospechoso formaDePelo isEqualTo: factory peloCorto.! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:40:41'!
test004_cuandoElSospechosoTieneOjosMarrones

	| unSospechoso |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
	
	Assert that: unSospechoso colorDeOjos isEqualTo: factory ojosMarrones! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:40:53'!
test005_cuandoElSospechosoTieneTezOsucra

	| unSospechoso |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
	
	Assert that: unSospechoso tez isEqualTo: factory tezOscura.! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:36:56'!
test006_cuandoElSospechosoNoEsLadron

	| unSospechoso |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
	
	Assert isFalse: (unSospechoso esLadron).! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:37:01'!
test007_cuandoElSospechosoRobaUnPais_esElLadron

	| unSospechoso |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
	
	unSospechoso robarObjetoA: factory argentina.
	
	Assert isTrue: (unSospechoso esLadron).! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:50:01'!
test008_cuandoElSospechosoNoEsLadronNoTieneRutaDeEscape

	| unSospechoso |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
	
	Assert should: [unSospechoso escaparPorRuta: factory rutaDeEscape1] signal: Error withDescription: unSospechoso errorNoEsLadron.
	Assert isFalse: (unSospechoso tieneRutaDeEscape).! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:50:08'!
test009_cuandoElSospechosoEsLadronTieneUnaRutaDeEscape

	| unSospechoso |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
							
	unSospechoso robarObjetoA: factory argentina.
	unSospechoso escaparPorRuta: factory rutaDeEscape1.
	
	Assert isTrue: (unSospechoso tieneRutaDeEscape).! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:50:13'!
test010_cuandoElSospechosoEsLadron_noPuedeNoTenerRutaDeEscape

	| unSospechoso |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
	unSospechoso robarObjetoA: factory argentina.
	
	Assert should: [unSospechoso escaparPorRuta: {}] signal: Error withDescription: unSospechoso errorLadronSinRuta.
	Assert isTrue: (unSospechoso tieneRutaDeEscape ).! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:50:19'!
test011_unSospechosoQueEsLadronTieneUnaListaDeCaracteristicas

	| unSospechoso |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
	unSospechoso robarObjetoA: factory argentina.

	Assert isTrue: (unSospechoso tieneRasgosFisicos ).
	Assert that: unSospechoso cantidadDeRasgosFisicos isEqualTo: 5.! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:50:23'!
test012_unSospechosoQueEsLadronYEscapaAUnPais_DejaDosPistasDeSuAspectoALosTestigoLocal

	| unSospechoso unTestigo |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
							
	unSospechoso robarObjetoA: factory argentina.
	unTestigo _ factory testigoChile1.
	unSospechoso escaparPorRuta: {factory colombia. factory chile}.
	
	
	
	Assert that: unTestigo cantidadDePistasDeAspecto isEqualTo: 2.
	Assert that: unSospechoso cantidadDeRasgosFisicos isEqualTo: 5.! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:50:28'!
test013_unSospechosoQueEsLadronYEscapaAUnPais_NoDejaPistasDeSuAspectoATestigoDeOtroPais

	| unSospechoso unTestigo |
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
							
	unSospechoso robarObjetoA: factory argentina.
	unSospechoso escaparPorRuta: {factory colombia. factory peru}.
	
	unTestigo _ factory testigoChile1.
	
	Assert should: [unSospechoso esVistoPor: unTestigo] signal: Error withDescription: unSospechoso errorNoPudoSerVistoEnEsePais .
	Assert that: unTestigo cantidadDePistasDeAspecto isEqualTo: 0.! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:50:35'!
test014_unSospechosoQueEsLadronYEscapaAUnPais_DejaDosPistasDeSuAspectoATodosTestigoLocales

	| unSospechoso|
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
							
	unSospechoso robarObjetoA: factory argentina.
	
	unSospechoso escaparPorRuta: {factory colombia. factory chile}.
	
	Assert that: factory testigoArgentina1 cantidadDePistasDeAspecto isEqualTo: 2.
	Assert that: factory testigoArgentina2 cantidadDePistasDeAspecto isEqualTo: 2.
	Assert that: factory testigoArgentina3 cantidadDePistasDeAspecto isEqualTo: 2.
	
	Assert that: factory testigoColombia1 cantidadDePistasDeAspecto isEqualTo: 2.
	Assert that: factory testigoColombia2 cantidadDePistasDeAspecto isEqualTo: 2.
	Assert that: factory testigoColombia3 cantidadDePistasDeAspecto isEqualTo: 2.
	
	Assert that: factory testigoChile1 cantidadDePistasDeAspecto isEqualTo: 2.
	Assert that: factory testigoChile2 cantidadDePistasDeAspecto isEqualTo: 2.
	Assert that: factory testigoChile3 cantidadDePistasDeAspecto isEqualTo: 2.
	
	
! !

!SospechosoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/7/2020 12:50:42'!
test015_unSospechosoQueEsLadronYtieneUnaRutaDeEscape_entregaComoPistaDePaisElSiguientePaisEnSuRutaDeEscapeATodosLosTestigosDelPais

	| unSospechoso|
	unSospechoso _ Sospechoso conNombre: (factory nombreSmithers) 
							colorDePelo: (factory peloGris) 
							formaDePelo: (factory peloCorto) 
							colorDeOjos: (factory ojosMarrones) 
							yTez: (factory tezOscura). 
							
	unSospechoso robarObjetoA: factory argentina.
	unSospechoso escaparPorRuta: {factory colombia. factory chile}.
	
	Assert that: factory testigoArgentina1 pistaDePais isEqualTo: factory colombia .
	Assert that: factory testigoArgentina2 pistaDePais isEqualTo: factory colombia.
	Assert that: factory testigoArgentina3 pistaDePais isEqualTo: factory colombia.
	
	Assert that: factory testigoColombia1 pistaDePais isEqualTo: factory chile .
	
	Assert that: factory testigoChile1 pistaDePais isEqualTo: factory argentina .

	
	
! !


!classDefinition: #TestigoTest category: 'TrabajoFinal-Entrega-Grupo2'!
TestCase subclass: #TestigoTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!TestigoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 10:54:22'!
setUp 

	factory _ FactoryObject new.! !

!TestigoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 10:55:01'!
test001_cuandoUnTestigoSeEncuentraEnUnPais

	| unTestigo |
	unTestigo _ Testigo conUbicacion: factory argentina .
	
	Assert that: unTestigo ubicacion isEqualTo: factory argentina.! !

!TestigoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 18:04:53'!
test002_cuandoUnTestigoNoTienePistaDePais

	| unTestigo |
	unTestigo _ Testigo conUbicacion: factory argentina.
	
	Assert that: unTestigo pistaDePais isEqualTo: nil.! !

!TestigoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 16:49:23'!
test003_cuandoUnTestigoTieneComoPistaDePaisAColombia

	| unTestigo unaPistaDePais |
	unTestigo _ Testigo conUbicacion: factory argentina.
	unaPistaDePais _ factory colombia.
	
	unTestigo agregarPistaDeRutaDe: unaPistaDePais.
	
	Assert that: unTestigo pistaDePais isEqualTo: factory colombia.! !

!TestigoTest methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 01:06:47'!
test004_cuandoUnTestigoNoTienePistasSobreElAspectoDelLadron

	| unTestigo |
	unTestigo _ Testigo conUbicacion: factory argentina.
	
	Assert isFalse: (unTestigo tienePistasDeAspecto).! !


!classDefinition: #ArchivoDePrueba category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #ArchivoDePrueba
	instanceVariableNames: 'contenido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!ArchivoDePrueba methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 22:40:27'!
filesContents

	^ contenido contents .! !


!ArchivoDePrueba methodsFor: 'initializing' stamp: 'DJVANP 12/9/2020 22:39:58'!
initialize 

	contenido _ ReadWriteStream on: ''.! !


!ArchivoDePrueba methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 22:49:10'!
copiarDe: unSteam 
	contenido _ unSteam contents.! !


!classDefinition: #Caracteristica category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #Caracteristica
	instanceVariableNames: 'descripcion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!Caracteristica methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 14:26:51'!
es: unaCaracteristica
	descripcion _ unaCaracteristica.! !

!Caracteristica methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 13:47:39'!
escribirEn: unStream 
		
	self subclassResponsibility.! !

!Caracteristica methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 13:47:53'!
perteneceA: unSospechoso  
		
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Caracteristica class' category: 'TrabajoFinal-Entrega-Grupo2'!
Caracteristica class
	instanceVariableNames: ''!

!Caracteristica class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 13:50:55'!
es: unaCaracteristica 

	^self new es: unaCaracteristica.! !


!classDefinition: #ColorDeOjos category: 'TrabajoFinal-Entrega-Grupo2'!
Caracteristica subclass: #ColorDeOjos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!ColorDeOjos methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 14:24:49'!
escribirEn: unStream 
	unStream nextPutAll: 'Su color de ojos es:  '.
	unStream nextPutAll: descripcion .! !

!ColorDeOjos methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/6/2020 00:12:26'!
perteneceA: unSospechoso  
	
	^ unSospechoso colorDeOjos = self .! !


!classDefinition: #ColorDePelo category: 'TrabajoFinal-Entrega-Grupo2'!
Caracteristica subclass: #ColorDePelo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!ColorDePelo methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 14:24:39'!
escribirEn: unStream 
	unStream nextPutAll: 'Su color de pelo es:  '.
	unStream nextPutAll: descripcion.! !

!ColorDePelo methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 23:56:57'!
perteneceA: unSospechoso  
	
	^ unSospechoso colorDePelo = self .! !


!classDefinition: #FormaDePelo category: 'TrabajoFinal-Entrega-Grupo2'!
Caracteristica subclass: #FormaDePelo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!FormaDePelo methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 14:24:55'!
escribirEn: unStream 
	unStream nextPutAll: 'Su tipo de pelo es:  '.
	unStream nextPutAll: descripcion.! !

!FormaDePelo methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/6/2020 00:12:39'!
perteneceA: unSospechoso  
	
	^ unSospechoso formaDePelo = self .! !


!classDefinition: #Nombre category: 'TrabajoFinal-Entrega-Grupo2'!
Caracteristica subclass: #Nombre
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!Nombre methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 14:25:06'!
escribirEn: unStream 
	unStream nextPutAll: 'El nombre del criminal era:  '.
	unStream nextPutAll: descripcion.! !

!Nombre methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/6/2020 00:13:03'!
perteneceA: unSospechoso  
	
	^ unSospechoso nombre = self .! !


!classDefinition: #Tez category: 'TrabajoFinal-Entrega-Grupo2'!
Caracteristica subclass: #Tez
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!Tez methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/10/2020 14:25:15'!
escribirEn: unStream 
	unStream nextPutAll: 'Y su tono de tez es:  '.
	unStream nextPutAll: descripcion.! !

!Tez methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/6/2020 00:14:14'!
perteneceA: unSospechoso  
	
	^ unSospechoso tez = self .! !


!classDefinition: #Detective category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #Detective
	instanceVariableNames: 'ubicacion tiempoDeViaje tiempoDeInterrogacion libreta esClasico esInterpol esPersuasivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:29:59'!
cantidadDePistasDeAspecto
	
	^ self libreta pistasAspectoCriminal size! !

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:30:02'!
cantidadDeSospechososEnLibreta

	^self libreta listaDeSospechosos size! !

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:33:35'!
libreta
	^libreta.! !

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:33:37'!
pistaDePaisDeCriminal
	^libreta pistaRutaCriminal .! !

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:33:41'!
primerPistaDeAspectoDe: unTestigo 
	
	^ unTestigo pistasDeAspecto first.! !

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:33:43'!
tiempoDeInterrogacion
	^tiempoDeInterrogacion! !

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:33:47'!
tiempoDeViaje
	^ tiempoDeViaje .! !

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:33:50'!
tiempoDeVueloHacia: unPais

	^ (self tipoDeViajaHacia: unPais)tiempoDeViajePara: self! !

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:33:52'!
tiempoTotalDeViajeHacia: unPais 

	(self detectiveSeEncuentraEn: unPais) ifTrue: [self error: self errorMismoPais ].	
	^ (unPais tiempoDeEsperaEnMigraciones) + (self tiempoDeVueloHacia: unPais).! !

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:33:57'!
tipoDePistaDe: unTestigo

	^ PistaDelAspecto pistaDeAspectoDe: unTestigo ! !

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:34:02'!
tipoDeViajaHacia: unPais

	^ Viaje tipoDeViajePara: self hacia: unPais! !

!Detective methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 23:34:05'!
ubicacion
	^ubicacion.! !


!Detective methodsFor: 'testing' stamp: 'DJVANP 12/9/2020 23:30:39'!
detectiveSeEncuentraEn: unPais

	^ unPais nombre == self ubicacion nombre! !

!Detective methodsFor: 'testing' stamp: 'DJVANP 12/9/2020 23:31:31'!
esClasico
	^esClasico ! !

!Detective methodsFor: 'testing' stamp: 'DJVANP 12/9/2020 23:31:33'!
esInterpol
	^esInterpol ! !

!Detective methodsFor: 'testing' stamp: 'DJVANP 12/9/2020 23:31:36'!
esPersuasivo
	^esPersuasivo! !

!Detective methodsFor: 'testing' stamp: 'DJVANP 12/9/2020 23:31:44'!
hayTiempoSuficienteEn: unaPartidaDeCarmenSanDiego paraViajarA: unPais

	^ (unaPartidaDeCarmenSanDiego tiempoRestante) >= (self tiempoTotalDeViajeHacia: unPais)! !

!Detective methodsFor: 'testing' stamp: 'DJVANP 12/9/2020 23:31:47'!
hayTiempoSuficienteParaInterrogarPara: unaPartidaDeCarmenSanDiego

	^ unaPartidaDeCarmenSanDiego tiempoRestante > tiempoDeInterrogacion! !

!Detective methodsFor: 'testing' stamp: 'DJVANP 12/9/2020 23:33:54'!
tienePistasDePais
	^ (libreta pistaRutaCriminal = nil) not.! !


!Detective methodsFor: 'errores' stamp: 'DJVANP 12/9/2020 23:31:21'!
errorDistintoPais

	^ 'No hay interrogatorio. No comparten pais'! !

!Detective methodsFor: 'errores' stamp: 'DJVANP 12/9/2020 23:31:25'!
errorMismoPais
	^ 'No se puede viajar al mismo pais donde el detective esta ubicado'.! !


!Detective methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 23:29:55'!
asignarLibreta: unaLibretaDeDetective 
	 libreta _ unaLibretaDeDetective.! !

!Detective methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 23:31:00'!
emitirOrdenDeArrestoEn: unaPartidaDeCarmenSanDiego 
	
	(OrdenDeArresto tipoDeOrdenDeArrestoPara: unaPartidaDeCarmenSanDiego) emitirOrdenPara: unaPartidaDeCarmenSanDiego.! !

!Detective methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 23:33:19'!
interrogarPorAspectoA: unTestigo 
	
	(self detectiveSeEncuentraEn: unTestigo ubicacion) ifFalse: [self error: self errorDistintoPais ].
	(self tipoDePistaDe: unTestigo) unaPistaDeAspectoPara: self de: unTestigo .
	
	libreta filtrarSospechosos.
	! !

!Detective methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 23:33:23'!
interrogarPorAspectoA: unTestigo para: unaPartidaCarmenSanDiego 
	
	(self detectiveSeEncuentraEn: unTestigo ubicacion) ifFalse: [self error: self errorDistintoPais ].
	(self hayTiempoSuficienteParaInterrogarPara: unaPartidaCarmenSanDiego) ifFalse: [self error: unaPartidaCarmenSanDiego errorFaltaTiempoParaInterrogar].
	
	self interrogarPorAspectoA: unTestigo.
	unaPartidaCarmenSanDiego restarTiempo: self tiempoDeInterrogacion.! !

!Detective methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 23:33:29'!
interrogarPorPaisA: unTestigo 
	
	(self detectiveSeEncuentraEn: unTestigo ubicacion) ifFalse: [self error: self errorDistintoPais ].
	(PistaDePais pistaDePaisDe: unTestigo para: self) unaPistaDePaisPara: self de: unTestigo.
	
	! !

!Detective methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 23:33:32'!
interrogarPorPaisA: unTestigo para: unaPartidaDeCarmenSanDiego 
	
	(self detectiveSeEncuentraEn: unTestigo ubicacion) ifFalse: [self error: self errorDistintoPais ].
	(self hayTiempoSuficienteParaInterrogarPara: unaPartidaDeCarmenSanDiego) ifFalse: [self error: unaPartidaDeCarmenSanDiego errorFaltaTiempoParaInterrogar].
	
	self interrogarPorPaisA: unTestigo.
	
	unaPartidaDeCarmenSanDiego restarTiempo: self tiempoDeInterrogacion.! !

!Detective methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 23:34:07'!
ubicadoEn: unPais  
	
	ubicacion _ unPais.! !

!Detective methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 23:34:10'!
viajarA: unPais

	(self detectiveSeEncuentraEn: unPais) ifTrue: [self error: self errorMismoPais ].	
	ubicacion _ unPais.
	
		
	
	! !

!Detective methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 23:34:12'!
viajarA: unPais para: unaPartidaDeCarmenSanDiego  

	(self hayTiempoSuficienteEn: unaPartidaDeCarmenSanDiego paraViajarA: unPais) ifFalse: [self error: unaPartidaDeCarmenSanDiego errorFaltaTiempoParaViajar ].
	
	unaPartidaDeCarmenSanDiego restarTiempo: (self tiempoTotalDeViajeHacia: unPais).
	
	self viajarA: unPais.

	
		
	
	! !


!Detective methodsFor: 'acciones-private' stamp: 'DJVANP 12/9/2020 23:27:42'!
agregarPistaDeAspectoDe: unTestigo 
	
	self subclassResponsibility.! !

!Detective methodsFor: 'acciones-private' stamp: 'DJVANP 12/9/2020 23:29:45'!
agregarPistaDePais: unPais 
	
	libreta agregarComoProximoPaisAViajar: unPais.! !


!classDefinition: #DetectiveClasico category: 'TrabajoFinal-Entrega-Grupo2'!
Detective subclass: #DetectiveClasico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!DetectiveClasico methodsFor: 'initializing' stamp: 'DJVANP 12/5/2020 18:55:42'!
initialize 

	tiempoDeViaje _ 10*hour.
	tiempoDeInterrogacion _ 2*hour.
	esClasico _ true.
	esInterpol _ false.
	esPersuasivo _ false.! !


!DetectiveClasico methodsFor: 'acciones-private' stamp: 'DJVANP 12/6/2020 14:03:16'!
agregarPistaDeAspectoDe: unTestigo 
	
	libreta agregarPistasDeAspectoCriminal: (self primerPistaDeAspectoDe: unTestigo).! !


!classDefinition: #DetectiveInterpol category: 'TrabajoFinal-Entrega-Grupo2'!
Detective subclass: #DetectiveInterpol
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!DetectiveInterpol methodsFor: 'initializing' stamp: 'DJVANP 12/5/2020 18:56:03'!
initialize 

	tiempoDeViaje _ 8*hour.
	tiempoDeInterrogacion _ 2*hour.
	esClasico _ false.
	esInterpol _ true.
	esPersuasivo _ false.! !


!DetectiveInterpol methodsFor: 'acciones-private' stamp: 'DJVANP 12/6/2020 14:03:20'!
agregarPistaDeAspectoDe: unTestigo 
	
	libreta agregarPistasDeAspectoCriminal: (self primerPistaDeAspectoDe: unTestigo).! !


!classDefinition: #DetectivePersuasivo category: 'TrabajoFinal-Entrega-Grupo2'!
Detective subclass: #DetectivePersuasivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!DetectivePersuasivo methodsFor: 'acciones-private' stamp: 'DJVANP 12/5/2020 15:13:42'!
agregarPistaDeAspectoDe: unTestigo  
	
	|pista1 pista2|
	pista1 _ (unTestigo pistasDeAspecto) first.
	unTestigo pistasDeAspecto removeFirst.
	pista2 _ (unTestigo pistasDeAspecto) first.
	unTestigo pistasDeAspecto addFirst: pista1.
	
	libreta agregarPistasDeAspectoCriminal: pista1.
	libreta agregarPistasDeAspectoCriminal: pista2.! !

!DetectivePersuasivo methodsFor: 'acciones-private' stamp: 'DJVANP 12/5/2020 19:09:00'!
agregarUnicaPistaDeAspectoDe: unTestigo 
	  
	|pista1 |
	pista1 _ (unTestigo pistasDeAspecto) first.
	unTestigo pistasDeAspecto removeFirst.

	libreta agregarPistasDeAspectoCriminal: pista1! !


!DetectivePersuasivo methodsFor: 'initializing' stamp: 'DJVANP 12/5/2020 18:56:23'!
initialize 

	tiempoDeViaje _ 10*hour.
	tiempoDeInterrogacion _ 1 *hour.
	esClasico _ false.
	esInterpol _ false.
	esPersuasivo _ true.! !


!classDefinition: #FactoryObject category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #FactoryObject
	instanceVariableNames: 'argentina chile peru colombia detectiveClasico detectiveInterpol detectivePersuasivo smithers maggie listaPaises1 listaPaises2 listaDeSospechosos2 listaDeSospechosos1 libretaDetective rutaDeEscape1 testigoColombia1 testigoColombia2 testigoColombia3 testigoArgentina1 testigoArgentina2 testigoArgentina3 testigoPeru1 testigoPeru2 testigoPeru3 testigoChile1 testigoChile2 testigoChile3 peloNegro peloRubio peloGris nombreSmithers nombreMaggie peloCorto peloLacio peloLargo peloOndulado sinPelo ojosAzules ojosMarrones ojosVerdes tezClara tezOscura tezMorena libretaDetectiveSospechosoUnico archivoDePrueba'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!
!FactoryObject commentStamp: '<historical>' prior: 0!
A partir de lo que hablamos con los profes, decidimos tener un objeto que provea de objetos a otros objetos a testear.
Aprendimos que se llama "FACTORY" y por eso respetamos ese nombre.!


!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:36:58'!
archivoDePrueba
	^ archivoDePrueba ! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:46:10'!
argentina 
	^ argentina.! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:49:32'!
chile 
	^ chile.! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:49:16'!
colombia 
	^ colombia.! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:56:33'!
contenidoDeArchivoDePrueba
	^ archivoDePrueba filesContents .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:49:43'!
detectiveClasico 
	^ detectiveClasico.! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:49:53'!
detectiveInterpol
	^ detectiveInterpol .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:50:05'!
detectivePersuasivo
	^ detectivePersuasivo .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:36:30'!
initialize

	argentina _ Pais conNombre: 'Argentina' yTiempoDeEsperaEnMigraciones: 2*hour.
	chile _ Pais conNombre: 'Chile' yTiempoDeEsperaEnMigraciones: 1*hour.
	colombia _ Pais conNombre: 'Colombia' yTiempoDeEsperaEnMigraciones: 3*hour.
	peru _ Pais conNombre: 'Peru' yTiempoDeEsperaEnMigraciones: 3*hour.
	
	argentina limitaCon: {chile}.
	chile limitaCon: {argentina. peru}.
	chile limitaCon: {peru. argentina}.
	peru limitaCon: {colombia. chile}.
	
	listaPaises1 _ OrderedCollection new.
	listaPaises1 addAll: {argentina. chile. colombia}.

	listaPaises2 _ OrderedCollection new.
	listaPaises2 addAll: {argentina. chile. argentina. colombia}.
	
	testigoColombia1 _ Testigo conUbicacion: colombia.
	testigoColombia2 _ Testigo conUbicacion: colombia.
	testigoColombia3 _ Testigo conUbicacion: colombia.
	
	testigoArgentina1 _ Testigo conUbicacion: argentina .
	testigoArgentina2 _ Testigo conUbicacion: argentina.
	testigoArgentina3 _ Testigo conUbicacion: argentina.
	
	testigoPeru1 _ Testigo conUbicacion: peru.
	testigoPeru2 _ Testigo conUbicacion: peru.
	testigoPeru3 _ Testigo conUbicacion: peru.
	
	testigoChile1 _ Testigo conUbicacion: chile.
	testigoChile2 _ Testigo conUbicacion: chile.
	testigoChile3 _ Testigo conUbicacion: chile.
	
	detectiveClasico _ DetectiveClasico new.
	detectiveInterpol _ DetectiveInterpol new.
	detectivePersuasivo _ DetectivePersuasivo new.

	peloNegro _ ColorDePelo es: 'Negro'.
	peloRubio _ ColorDePelo es: 'Rubio'.
	peloGris _ ColorDePelo es: 'Gris'.
	
	nombreSmithers _ Nombre es: 'Smithers'.
	nombreMaggie _ Nombre es: 'Maggie'.
	
	peloCorto _ FormaDePelo es: 'Corto'.
	peloLacio _ FormaDePelo es: 'Lacio'.
	peloLargo _ FormaDePelo es: 'Largo'.
	peloOndulado _ FormaDePelo es: 'Ondulado'.
	sinPelo _ FormaDePelo es: 'Pelado'.
	
	ojosAzules _ ColorDeOjos es: 'Azul'.
	ojosMarrones _ ColorDeOjos es: 'Marron'.
	ojosVerdes _ ColorDeOjos es: 'Verde'.
	
	tezClara _ Tez es: 'Clara'.
	tezOscura _ Tez es: 'Oscura'.
	tezMorena _ Tez es: 'Morena'.
	
	smithers _ Sospechoso conNombre:  nombreSmithers colorDePelo: peloGris formaDePelo: peloCorto colorDeOjos: ojosMarrones yTez: tezOscura. 						
	maggie _ Sospechoso conNombre:  nombreMaggie colorDePelo: peloRubio formaDePelo: peloCorto colorDeOjos: ojosAzules yTez: tezClara . 
	
	listaDeSospechosos1 _ Set new.
	listaDeSospechosos1 addAll: {smithers. maggie}.
	
	listaDeSospechosos2 _ Set new.
	listaDeSospechosos2 addAll: {smithers. maggie. maggie}. 
	
	libretaDetective _ LibretaDeDetective conPaisesConocidos: listaPaises1 ySospechosos: listaDeSospechosos1.
	libretaDetectiveSospechosoUnico _ LibretaDeDetective conPaisesConocidos: listaPaises1 ySospechosos: {smithers}.
	
	rutaDeEscape1 _ OrderedCollection new.
	rutaDeEscape1 addAll: {colombia. peru}.
	
	archivoDePrueba _ ArchivoDePrueba new.
	
	


! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:52:33'!
libretaDetective 
	^ libretaDetective .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/8/2020 10:27:09'!
libretaDetectiveSospechosoUnico
	^ libretaDetectiveSospechosoUnico .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:50:24'!
listaDePaises1
	^ listaPaises1 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:50:27'!
listaDePaises2
	^ listaPaises2 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:51:09'!
listaDeSospechosos1
	^ listaDeSospechosos1 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:51:13'!
listaDeSospechosos2
	^ listaDeSospechosos2 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:50:40'!
maggie
	^ maggie .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:33:12'!
nombreSmithers
	^nombreSmithers! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:35:00'!
ojosAzules
	^ojosAzules! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:33:35'!
ojosMarrones
	^ojosMarrones! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:35:05'!
ojosVerdes
	^ojosVerdes! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/6/2020 00:29:51'!
pelado
	^sinPelo ! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:33:28'!
peloCorto
	^peloCorto! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:33:21'!
peloGris
	^peloGris! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/6/2020 00:29:35'!
peloLacio
	^peloLacio ! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:34:22'!
peloNegro
	^peloNegro.! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/6/2020 00:29:27'!
peloOndulado
	^peloOndulado ! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:33:53'!
peloRubio
	^peloRubio. ! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:49:20'!
peru 
	^ peru.! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 10:58:54'!
rutaDeEscape1
	^ rutaDeEscape1 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/29/2020 21:50:35'!
smithers
	^ smithers .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 15:59:29'!
testigoArgentina1
	^ testigoArgentina1 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 15:59:32'!
testigoArgentina2
	^ testigoArgentina2 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 15:59:35'!
testigoArgentina3
	^ testigoArgentina3 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 15:58:24'!
testigoChile1
	^ testigoChile1.! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 15:59:14'!
testigoChile2
	^ testigoChile2.! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 15:59:17'!
testigoChile3
	^ testigoChile3.! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 16:00:02'!
testigoColombia1
	^ testigoColombia1 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 16:00:06'!
testigoColombia2
	^ testigoColombia2 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 16:00:09'!
testigoColombia3
	^ testigoColombia3 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 15:59:47'!
testigoPeru1
	^ testigoPeru1 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 15:59:51'!
testigoPeru2
	^ testigoPeru2 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/30/2020 15:59:54'!
testigoPeru3
	^ testigoPeru3 .! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:35:30'!
tezClara
	^tezClara ! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 22:35:37'!
tezMorena
	^tezMorena ! !

!FactoryObject methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/3/2020 22:33:42'!
tezOscura
	^tezOscura! !


!classDefinition: #LibretaDeDetective category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #LibretaDeDetective
	instanceVariableNames: 'paisesConocidos listaDeSospechosos pistasRutaCriminal pistasAspectoCriminal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!LibretaDeDetective methodsFor: 'testing' stamp: 'DJVANP 12/7/2020 12:17:42'!
tienePaisesConocidos
	^ paisesConocidos notEmpty.! !

!LibretaDeDetective methodsFor: 'testing' stamp: 'DJVANP 12/7/2020 12:26:06'!
tienePistasAspectoCriminal
	^pistasAspectoCriminal notEmpty.! !

!LibretaDeDetective methodsFor: 'testing' stamp: 'DJVANP 12/7/2020 12:22:29'!
tieneSospechososEnLaLista
	^ listaDeSospechosos notEmpty.! !


!LibretaDeDetective methodsFor: 'initializing' stamp: 'DJVANP 11/29/2020 20:42:40'!
conPaisesConocidos: unaListaDePaises ySospechosos: unaListaDeSospechosos  
	
	paisesConocidos addAll: unaListaDePaises.
	listaDeSospechosos addAll: unaListaDeSospechosos.! !

!LibretaDeDetective methodsFor: 'initializing' stamp: 'DJVANP 12/5/2020 18:09:18'!
initialize 

	paisesConocidos _ Set new.
	listaDeSospechosos _ Set new.
	pistasAspectoCriminal _ Set new.
	pistasRutaCriminal _ nil.! !


!LibretaDeDetective methodsFor: 'accessing' stamp: 'DJVANP 12/7/2020 12:19:34'!
cantidadDePaisesConocidos
	^ paisesConocidos size .! !

!LibretaDeDetective methodsFor: 'accessing' stamp: 'DJVANP 12/7/2020 12:24:40'!
cantidadDeSospechosos
	^ listaDeSospechosos size.! !

!LibretaDeDetective methodsFor: 'accessing' stamp: 'DJVANP 11/29/2020 20:41:53'!
listaDeSospechosos
	^ listaDeSospechosos.! !

!LibretaDeDetective methodsFor: 'accessing' stamp: 'DJVANP 11/29/2020 20:08:46'!
paisesConocidos
	^ paisesConocidos .! !

!LibretaDeDetective methodsFor: 'accessing' stamp: 'DJVANP 12/4/2020 18:46:51'!
pistaRutaCriminal
	^ pistasRutaCriminal.! !

!LibretaDeDetective methodsFor: 'accessing' stamp: 'DJVANP 11/29/2020 20:59:17'!
pistasAspectoCriminal
	^pistasAspectoCriminal.! !


!LibretaDeDetective methodsFor: 'acciones' stamp: 'DJVANP 12/5/2020 18:08:58'!
agregarComoProximoPaisAViajar: unPais 
	
	pistasRutaCriminal _ unPais.! !

!LibretaDeDetective methodsFor: 'acciones' stamp: 'DJVANP 12/3/2020 16:28:56'!
agregarPistasDeAspectoCriminal: unaPista

	pistasAspectoCriminal add: unaPista.

! !

!LibretaDeDetective methodsFor: 'acciones' stamp: 'DJVANP 12/6/2020 00:10:46'!
filtrarSospechosos
	listaDeSospechosos _ listaDeSospechosos select: [:sospechoso | sospechoso cumpleConCaracterisitcas: pistasAspectoCriminal ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LibretaDeDetective class' category: 'TrabajoFinal-Entrega-Grupo2'!
LibretaDeDetective class
	instanceVariableNames: ''!

!LibretaDeDetective class methodsFor: 'instance creation' stamp: 'DJVANP 11/29/2020 20:40:12'!
conPaisesConocidos: unaListaDePaises ySospechosos: unaListaDeSospechosos  

	^self new conPaisesConocidos: unaListaDePaises ySospechosos: unaListaDeSospechosos. ! !


!classDefinition: #OrdenDeArresto category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #OrdenDeArresto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!OrdenDeArresto methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/8/2020 10:49:53'!
emitirOrdenPara: unaPartidaDeCarmenSanDiego 

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrdenDeArresto class' category: 'TrabajoFinal-Entrega-Grupo2'!
OrdenDeArresto class
	instanceVariableNames: ''!

!OrdenDeArresto class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/8/2020 10:49:35'!
puedeEmitirOrden: unaPartidaDeCarmenSanDiego 	
	
	self subclassResponsibility.! !

!OrdenDeArresto class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/8/2020 10:45:51'!
tipoDeOrdenDeArrestoPara: unaPartidaDeCarmenSanDiego 
	
	^ (self subclasses detect: [:tipoDeOrden | tipoDeOrden puedeEmitirOrden: unaPartidaDeCarmenSanDiego]) new.! !


!classDefinition: #OrdenDeArrestoAcertada category: 'TrabajoFinal-Entrega-Grupo2'!
OrdenDeArresto subclass: #OrdenDeArrestoAcertada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!OrdenDeArrestoAcertada methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 14:47:47'!
emitirOrdenPara: unaPartidaDeCarmenSanDiego 
	
	unaPartidaDeCarmenSanDiego ganarPartida.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrdenDeArrestoAcertada class' category: 'TrabajoFinal-Entrega-Grupo2'!
OrdenDeArrestoAcertada class
	instanceVariableNames: ''!

!OrdenDeArrestoAcertada class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/8/2020 22:06:25'!
puedeEmitirOrden: unaPartidaDeCarmenSanDiego 	
	
	^ (unaPartidaDeCarmenSanDiego detective libreta cantidadDeSospechosos) = 1.

	! !


!classDefinition: #OrdenDeArrestoEquivocada category: 'TrabajoFinal-Entrega-Grupo2'!
OrdenDeArresto subclass: #OrdenDeArrestoEquivocada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!OrdenDeArrestoEquivocada methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/8/2020 11:03:38'!
emitirOrdenPara: unaPartidaDeCarmenSanDiego 
	
	unaPartidaDeCarmenSanDiego perderPartida.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrdenDeArrestoEquivocada class' category: 'TrabajoFinal-Entrega-Grupo2'!
OrdenDeArrestoEquivocada class
	instanceVariableNames: ''!

!OrdenDeArrestoEquivocada class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/8/2020 22:07:41'!
puedeEmitirOrden: unaPartidaDeCarmenSanDiego 
	
	^ (unaPartidaDeCarmenSanDiego detective libreta cantidadDeSospechosos ) > 1.! !


!classDefinition: #Pais category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #Pais
	instanceVariableNames: 'nombre tiempoEnMigraciones paisesLimitrofes tieneObjetoDeValor listaDeTestigos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!Pais methodsFor: 'testing' stamp: 'DJVANP 11/25/2020 14:35:15'!
esLimitrofeDe: unPais 
	^ paisesLimitrofes includes: unPais.! !

!Pais methodsFor: 'testing' stamp: 'DJVANP 11/25/2020 17:39:13'!
tieneObjetoDeValor
	^tieneObjetoDeValor.! !

!Pais methodsFor: 'testing' stamp: 'DJVANP 12/7/2020 12:32:16'!
tienePaisesLimitrofes
	^ paisesLimitrofes notEmpty.! !

!Pais methodsFor: 'testing' stamp: 'DJVANP 12/7/2020 12:35:25'!
tieneTestigos
	^ listaDeTestigos notEmpty.! !


!Pais methodsFor: 'accessing' stamp: 'DJVANP 12/7/2020 12:33:08'!
cantidadDePaisesLimitrofes
	^ paisesLimitrofes size.! !

!Pais methodsFor: 'accessing' stamp: 'DJVANP 11/28/2020 13:46:11'!
listaDeTestigos
	^ listaDeTestigos .! !

!Pais methodsFor: 'accessing' stamp: 'DJVANP 11/18/2020 16:37:12'!
nombre
	^ nombre.! !

!Pais methodsFor: 'accessing' stamp: 'DJVANP 11/25/2020 14:25:52'!
paisesLimitrofes
	^ paisesLimitrofes .! !

!Pais methodsFor: 'accessing' stamp: 'DJVANP 11/18/2020 17:33:54'!
tiempoDeEsperaEnMigraciones
	^ tiempoEnMigraciones .! !


!Pais methodsFor: 'acciones' stamp: 'DJVANP 11/28/2020 14:20:26'!
esRobado
	
	tieneObjetoDeValor _ false.! !

!Pais methodsFor: 'acciones' stamp: 'DJVANP 11/29/2020 22:15:12'!
limitaCon: listaDePaises 
	
	paisesLimitrofes addAll: listaDePaises.
	listaDePaises collect: [:pais | pais paisesLimitrofes add: self]! !


!Pais methodsFor: 'initializing' stamp: 'DJVANP 11/25/2020 14:46:22'!
conNombre: unPais yTiempoDeEsperaEnMigraciones: cantidadDeHoras   
	
	nombre _ unPais.
	tiempoEnMigraciones _ cantidadDeHoras.! !

!Pais methodsFor: 'initializing' stamp: 'DJVANP 12/4/2020 17:46:17'!
initialize 

	paisesLimitrofes _ Set new.
	tieneObjetoDeValor _ true.
	listaDeTestigos _ OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pais class' category: 'TrabajoFinal-Entrega-Grupo2'!
Pais class
	instanceVariableNames: ''!

!Pais class methodsFor: 'instance creation' stamp: 'DJVANP 11/25/2020 14:45:41'!
conNombre: unPais yTiempoDeEsperaEnMigraciones: cantidadDeHoras   

	^self new conNombre: unPais yTiempoDeEsperaEnMigraciones: cantidadDeHoras. ! !


!classDefinition: #PartidaCarmenSanDiego category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #PartidaCarmenSanDiego
	instanceVariableNames: 'tiempoRestantes paisDelRobo ladron detective stream'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!PartidaCarmenSanDiego methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 15:04:30'!
agregarDatosDePartidaEn: unStream.
 
		unStream newLine.
		unStream nextPutAll: 'Tiempo restante: '.
		unStream nextPutAll: tiempoRestantes asString.
		unStream newLine.
		unStream nextPutAll: 'Pais del robo: '.
		unStream nextPutAll: paisDelRobo nombre .
		! !

!PartidaCarmenSanDiego methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 22:26:22'!
alDetectiveSeLeAsignaUnaLibreta: unaLibreta

	detective asignarLibreta: unaLibreta.! !

!PartidaCarmenSanDiego methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 22:46:05'!
copiarStreamEnArchivoDePrueba: unArchivoDePrueba  
	
	unArchivoDePrueba copiarDe: stream.! !

!PartidaCarmenSanDiego methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 16:51:55'!
detectiveEmiteOrdenDeArrestoEnPartida
	detective emitirOrdenDeArrestoEn: self! !

!PartidaCarmenSanDiego methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 16:36:28'!
detectiveInterrogaPorAspectoA: unTestigo 
	detective interrogarPorAspectoA: unTestigo para: self ! !

!PartidaCarmenSanDiego methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 16:40:31'!
detectiveInterrogaPorPaisA: unTestigo 
	detective interrogarPorPaisA: unTestigo para: self! !

!PartidaCarmenSanDiego methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 16:26:36'!
detectiveViajaA: unPais

	detective viajarA: unPais para: self! !

!PartidaCarmenSanDiego methodsFor: 'acciones' stamp: 'DJVANP 12/9/2020 14:45:08'!
imprimirDerrotaEn: unStream  

		unStream reset.
		unStream nextPutAll: 'PERDISTE LA PARTIDA !!'.
		unStream newLine.
		unStream nextPutAll: 'Datos del criminal'.
		unStream newLine.
		self ladron listaDeRasgosFisicos do:[:caracteristica | caracteristica escribirEn: unStream. unStream newLine].
		unStream newLine.
		unStream nextPutAll: 'El detective ser� revocado de su cargo debido a su incompetencia para resolver el caso. El ladron logr� salirse con la suya. Ahora con el dinero va a vivir comodamente en su nueva isla privada'.
! !

!PartidaCarmenSanDiego methodsFor: 'acciones' stamp: 'DJVANP 11/30/2020 15:20:41'!
restarTiempo: unaCantidadDeHoras 
	tiempoRestantes _ tiempoRestantes - unaCantidadDeHoras.! !


!PartidaCarmenSanDiego methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 22:53:14'!
contenidoDeStream 
	^ stream contents.! !

!PartidaCarmenSanDiego methodsFor: 'accessing' stamp: 'DJVANP 11/28/2020 15:48:51'!
detective
	^ detective.! !

!PartidaCarmenSanDiego methodsFor: 'accessing' stamp: 'DJVANP 11/28/2020 15:41:01'!
ladron
	^ladron.! !

!PartidaCarmenSanDiego methodsFor: 'accessing' stamp: 'DJVANP 11/28/2020 15:24:03'!
paisDelRobo
	^ paisDelRobo.! !

!PartidaCarmenSanDiego methodsFor: 'accessing' stamp: 'DJVANP 12/9/2020 15:25:10'!
stream 
	^ stream.! !

!PartidaCarmenSanDiego methodsFor: 'accessing' stamp: 'DJVANP 11/28/2020 15:06:23'!
tiempoRestante
	^ tiempoRestantes .! !

!PartidaCarmenSanDiego methodsFor: 'accessing' stamp: 'DJVANP 12/7/2020 12:37:03'!
ubicacionDeDetective
	^ detective ubicacion.! !


!PartidaCarmenSanDiego methodsFor: 'testing' stamp: 'DJVANP 12/8/2020 10:13:39'!
estaPerdida
	^ tiempoRestantes = (0*hour).! !


!PartidaCarmenSanDiego methodsFor: 'initializing' stamp: 'DJVANP 12/9/2020 14:31:35'!
empezarPartidaConHoras: unaCantidadDeHoras enPais: unPais robadoPor: unSospechoso conDetective: unDetective    
	
	tiempoRestantes _ unaCantidadDeHoras.
	paisDelRobo _ unPais.
	ladron _ unSospechoso.
	detective _ unDetective.
	
	ladron robarObjetoA: unPais. 
	detective ubicadoEn: paisDelRobo.
	stream _ WriteStream on: ''.
	! !


!PartidaCarmenSanDiego methodsFor: 'acciones-private' stamp: 'DJVANP 12/9/2020 16:46:40'!
ganarPartida
	
	(self detective cantidadDeSospechososEnLibreta > 1) ifTrue: [self error: self errorImposibleGanarPartidaAun].
	self imprimirOrdenDeArrestoFirmeEn: stream.
	'ResultadoDePartida.txt' asFileEntry fileContents: stream contents.! !

!PartidaCarmenSanDiego methodsFor: 'acciones-private' stamp: 'DJVANP 12/9/2020 15:03:15'!
imprimirOrdenDeArrestoFirmeEn: unStream 

		unStream reset.
		unStream nextPutAll: 'CASO RESUELTO. GANASTE LA PARTIDA !!'.
		unStream newLine.
		unStream nextPutAll: 'Caracteristicas del criminal atrapado: '.
		unStream newLine.
		self ladron listaDeRasgosFisicos do:[:caracteristica | caracteristica escribirEn: unStream. unStream newLine].
		unStream newLine.
		unStream nextPutAll: 'Excelente trabajo detective, has resuelto un caso dificil. Te espero esta noche para una cena y hablar de su ascenso'.
		self agregarDatosDePartidaEn: unStream.
		
		! !

!PartidaCarmenSanDiego methodsFor: 'acciones-private' stamp: 'DJVANP 12/9/2020 16:47:12'!
perderPartida
	tiempoRestantes _ 0*hour.
	self imprimirDerrotaEn: stream.
	'ResultadoDePartida.txt' asFileEntry fileContents: stream contents.! !


!PartidaCarmenSanDiego methodsFor: 'errores' stamp: 'DJVANP 11/30/2020 15:50:43'!
errorFaltaTiempoParaInterrogar
	^ 'Falta tiempo para interrogar al testigo'.! !

!PartidaCarmenSanDiego methodsFor: 'errores' stamp: 'DJVANP 11/30/2020 15:29:14'!
errorFaltaTiempoParaViajar
	^ 'No hay tiempo suficiente para viajar'! !

!PartidaCarmenSanDiego methodsFor: 'errores' stamp: 'DJVANP 12/9/2020 15:08:15'!
errorImposibleGanarPartidaAun
	
	^ 'No se puede ganar una partida cuando aun quedan mas de un sospechoso que filtrar'. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PartidaCarmenSanDiego class' category: 'TrabajoFinal-Entrega-Grupo2'!
PartidaCarmenSanDiego class
	instanceVariableNames: ''!

!PartidaCarmenSanDiego class methodsFor: 'instance creation' stamp: 'DJVANP 11/28/2020 15:47:03'!
empezarPartidaConHoras: unaCantidadDeHoras enPais: unPais robadoPor: unSospechoso conDetective: unDetective    
	^self new empezarPartidaConHoras: unaCantidadDeHoras enPais: unPais robadoPor: unSospechoso conDetective: unDetective. ! !


!classDefinition: #PistaDePais category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #PistaDePais
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!PistaDePais methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 18:59:43'!
unaPistaDePaisPara: unDetective de: unTestigo 

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PistaDePais class' category: 'TrabajoFinal-Entrega-Grupo2'!
PistaDePais class
	instanceVariableNames: ''!

!PistaDePais class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 18:57:59'!
pistaDePaisDe: unTestigo para: unDetective  
	
	^ (self subclasses detect: [:tipoDePistaPais | tipoDePistaPais tienePistaDePais: unTestigo para: unDetective]) new.! !

!PistaDePais class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 18:58:52'!
tienePistaDePais: unTestigo para: unDetective

	self subclassResponsibility.! !


!classDefinition: #PistaDePaisNula category: 'TrabajoFinal-Entrega-Grupo2'!
PistaDePais subclass: #PistaDePaisNula
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!PistaDePaisNula methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 18:07:38'!
unaPistaDePaisPara: unDetective de: unTestigo 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PistaDePaisNula class' category: 'TrabajoFinal-Entrega-Grupo2'!
PistaDePaisNula class
	instanceVariableNames: ''!

!PistaDePaisNula class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 19:05:05'!
tienePistaDePais: unTestigo para: unDetective  
	^ ((unTestigo pistaDePais) = nil).! !


!classDefinition: #PistaDePaisValida category: 'TrabajoFinal-Entrega-Grupo2'!
PistaDePais subclass: #PistaDePaisValida
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!PistaDePaisValida methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 18:06:27'!
unaPistaDePaisPara: unDetective de: unTestigo 
	
	unDetective agregarPistaDePais: unTestigo pistaDePais.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PistaDePaisValida class' category: 'TrabajoFinal-Entrega-Grupo2'!
PistaDePaisValida class
	instanceVariableNames: ''!

!PistaDePaisValida class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 19:06:19'!
tienePistaDePais: unTestigo para: unDetective  
	
	^ ((unTestigo pistaDePais = nil) not) & ( (unDetective esPersuasivo) not).! !


!classDefinition: #PistaDePaisValidaParaPersuasivo category: 'TrabajoFinal-Entrega-Grupo2'!
PistaDePais subclass: #PistaDePaisValidaParaPersuasivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!PistaDePaisValidaParaPersuasivo methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 19:00:22'!
unaPistaDePaisPara: unDetective de: unTestigo 

    unDetective agregarPistaDePais: unTestigo pistaDePais.
    unDetective agregarUnicaPistaDeAspectoDe: unTestigo.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PistaDePaisValidaParaPersuasivo class' category: 'TrabajoFinal-Entrega-Grupo2'!
PistaDePaisValidaParaPersuasivo class
	instanceVariableNames: ''!

!PistaDePaisValidaParaPersuasivo class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 19:01:14'!
tienePistaDePais: unTestigo para: unDetective  
	^ ((unTestigo pistaDePais = nil) not) & (unDetective esPersuasivo).! !


!classDefinition: #PistaDelAspecto category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #PistaDelAspecto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!PistaDelAspecto methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 17:06:54'!
unaPistaDeAspectoPara: unDetective de: unTestigo 

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PistaDelAspecto class' category: 'TrabajoFinal-Entrega-Grupo2'!
PistaDelAspecto class
	instanceVariableNames: ''!

!PistaDelAspecto class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 17:17:20'!
pistaDeAspectoDe: unTestigo 
	
	^ (self subclasses detect: [:tipoDePista | tipoDePista tienePistaDeAspecto: unTestigo]) new.! !

!PistaDelAspecto class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 17:05:13'!
tienePistaDeAspecto: unTestigo 
	
	self subclassResponsibility.! !


!classDefinition: #AspectoNula category: 'TrabajoFinal-Entrega-Grupo2'!
PistaDelAspecto subclass: #AspectoNula
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!AspectoNula methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 17:01:49'!
unaPistaDeAspectoPara: unDetective de: unTestigo 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AspectoNula class' category: 'TrabajoFinal-Entrega-Grupo2'!
AspectoNula class
	instanceVariableNames: ''!

!AspectoNula class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 17:05:31'!
tienePistaDeAspecto: unTestigo 
	 
	^ unTestigo pistasDeAspecto isEmpty.! !


!classDefinition: #AspectoValido category: 'TrabajoFinal-Entrega-Grupo2'!
PistaDelAspecto subclass: #AspectoValido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!AspectoValido methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 17:01:49'!
unaPistaDeAspectoPara: unDetective de: unTestigo 
	
	unDetective agregarPistaDeAspectoDe: unTestigo.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AspectoValido class' category: 'TrabajoFinal-Entrega-Grupo2'!
AspectoValido class
	instanceVariableNames: ''!

!AspectoValido class methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/5/2020 17:06:08'!
tienePistaDeAspecto: unTestigo 
	
	^ (unTestigo pistasDeAspecto isEmpty) not.! !


!classDefinition: #Sospechoso category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #Sospechoso
	instanceVariableNames: 'nombre colorDePelo formaDePelo colorDeOjos tez caracteristicas rutaDeEscape esLadron listaDeRasgosFisicos paisesPorRecorrer proximosPaises'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!Sospechoso methodsFor: 'acciones' stamp: 'DJVANP 12/4/2020 18:28:20'!
actualizarProximoPais
	
	| primeroActual|
	primeroActual _ proximosPaises first.
	proximosPaises removeFirst.
	proximosPaises addLast: primeroActual.! !

!Sospechoso methodsFor: 'acciones' stamp: 'DJVANP 12/2/2020 16:38:14'!
crearListasDeRasgosFisicos

	listaDeRasgosFisicos add: nombre.
	listaDeRasgosFisicos add: colorDePelo.
	listaDeRasgosFisicos add: formaDePelo.
	listaDeRasgosFisicos add: colorDeOjos.
	listaDeRasgosFisicos add: tez! !

!Sospechoso methodsFor: 'acciones' stamp: 'DJVANP 12/4/2020 18:17:47'!
dejarPistaATestigosDe: unPais 

	unPais listaDeTestigos do: [:testigo | self esVistoPor: testigo].
	self actualizarProximoPais.
	! !

!Sospechoso methodsFor: 'acciones' stamp: 'DJVANP 12/4/2020 18:25:42'!
dejarPistasEn: unaColeccionDePaises 
	
	unaColeccionDePaises do: [:unPais | self dejarPistaATestigosDe: unPais].
! !

!Sospechoso methodsFor: 'acciones' stamp: 'DJVANP 12/4/2020 18:26:25'!
esVistoPor: unTestigo

	| pista1 pista2 |
	
	(self rutaDeEscape includes: unTestigo ubicacion) ifFalse: [self error: self errorNoPudoSerVistoEnEsePais].
	
	"unTestigo agregarPistaPais: self proximoPaisDeRuta."
	
	pista1 _ self listaDeRasgosFisicos first.
	self listaDeRasgosFisicos removeFirst.
	self listaDeRasgosFisicos addLast: pista1.
	
	pista2 _ self listaDeRasgosFisicos first.
	self listaDeRasgosFisicos removeFirst.
	self listaDeRasgosFisicos addLast: pista2.
	
	unTestigo agregarPistaDeRutaDe: self proximoPais.
	unTestigo agregarPistasDeAspecto: pista1.
	unTestigo agregarPistasDeAspecto: pista2.
	
	
	! !

!Sospechoso methodsFor: 'acciones' stamp: 'DJVANP 12/4/2020 18:43:28'!
escaparPorRuta: unaListaDePaises 
	
	(self esLadron) ifFalse: [self error: self errorNoEsLadron].
	
	rutaDeEscape addAll: unaListaDePaises.

	((self esLadron) & ((self rutaDeEscape size) = 1)) ifTrue: [self error: self errorLadronSinRuta ].
	
	proximosPaises addAll: rutaDeEscape.
	self actualizarProximoPais.
	
	self dejarPistasEn: self rutaDeEscape.
	
	! !

!Sospechoso methodsFor: 'acciones' stamp: 'DJVANP 12/3/2020 14:16:57'!
robarObjetoA: unPais 
	
	esLadron  _ true.
	unPais esRobado.
	rutaDeEscape add: unPais.! !


!Sospechoso methodsFor: 'accessing' stamp: 'DJVANP 12/7/2020 12:43:45'!
cantidadDeRasgosFisicos
	 ^ listaDeRasgosFisicos size.! !

!Sospechoso methodsFor: 'accessing' stamp: 'DJVANP 12/2/2020 15:26:18'!
colorDeOjos
	^colorDeOjos.! !

!Sospechoso methodsFor: 'accessing' stamp: 'DJVANP 12/2/2020 15:26:11'!
colorDePelo
	^colorDePelo.! !

!Sospechoso methodsFor: 'accessing' stamp: 'DJVANP 12/2/2020 15:25:51'!
formaDePelo
	^formaDePelo.! !

!Sospechoso methodsFor: 'accessing' stamp: 'DJVANP 12/2/2020 15:43:10'!
listaDeRasgosFisicos
	 ^ listaDeRasgosFisicos.! !

!Sospechoso methodsFor: 'accessing' stamp: 'DJVANP 12/2/2020 15:25:28'!
nombre
	^ nombre! !

!Sospechoso methodsFor: 'accessing' stamp: 'DJVANP 12/3/2020 14:38:58'!
paisesPorRecorrer
	^ paisesPorRecorrer.! !

!Sospechoso methodsFor: 'accessing' stamp: 'DJVANP 12/4/2020 18:27:10'!
proximoPais
	^ proximosPaises first.! !

!Sospechoso methodsFor: 'accessing' stamp: 'DJVANP 11/28/2020 14:03:10'!
rutaDeEscape
	^ rutaDeEscape .! !

!Sospechoso methodsFor: 'accessing' stamp: 'DJVANP 12/2/2020 15:25:40'!
tez
	^tez.! !


!Sospechoso methodsFor: 'initializing' stamp: 'DJVANPANP 12/2/2020 16:38:14'!
conNombre: unNombre colorDePelo: unColorDePelo formaDePelo: unaFormaDePelo colorDeOjos: unColorDeOjos yTez: unaTez 
	
	nombre _ unNombre.
	colorDePelo _ unColorDePelo.
	formaDePelo _ unaFormaDePelo.
	colorDeOjos _ unColorDeOjos.
	tez _ unaTez.
	
	self crearListasDeRasgosFisicos.! !

!Sospechoso methodsFor: 'initializing' stamp: 'DJVANP 12/4/2020 18:25:19'!
initialize 

	rutaDeEscape _ OrderedCollection new.
	esLadron _ false.
	listaDeRasgosFisicos _ OrderedCollection new.
	proximosPaises _ OrderedCollection new.! !


!Sospechoso methodsFor: 'testing' stamp: 'DJVANP 12/6/2020 00:31:59'!
cumpleConCaracterisitcas: unaColeccionDeCaracteristicas  
	
	^ unaColeccionDeCaracteristicas allSatisfy: [:caracteristica | caracteristica perteneceA: self].! !

!Sospechoso methodsFor: 'testing' stamp: 'DJVANP 11/28/2020 14:21:11'!
esLadron
	^ esLadron .! !

!Sospechoso methodsFor: 'testing' stamp: 'DJVANP 12/7/2020 12:46:22'!
tieneRasgosFisicos
	 ^ listaDeRasgosFisicos notEmpty.! !

!Sospechoso methodsFor: 'testing' stamp: 'DJVANP 12/7/2020 12:41:17'!
tieneRutaDeEscape
	^ rutaDeEscape notEmpty .! !


!Sospechoso methodsFor: 'errores' stamp: 'DJVANP 11/28/2020 14:42:12'!
errorLadronSinRuta
	^ ' Un ladron debe tener una ruta de escape'! !

!Sospechoso methodsFor: 'errores' stamp: 'DJVANP 11/28/2020 14:29:28'!
errorNoEsLadron
	^ 'Un sospechoso que no es ladron no tiene una ruta de escape.'! !

!Sospechoso methodsFor: 'errores' stamp: 'DJVANP 12/2/2020 16:23:35'!
errorNoPudoSerVistoEnEsePais
	^ 'El ladron nunca paso por el pais del testigo que dice haberlo visto'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sospechoso class' category: 'TrabajoFinal-Entrega-Grupo2'!
Sospechoso class
	instanceVariableNames: ''!

!Sospechoso class methodsFor: 'instance creation' stamp: 'DJVANP 12/2/2020 15:35:21'!
conNombre: unNombre colorDePelo: unColorDePelo formaDePelo: unaFormaDePelo colorDeOjos: unColorDeOjos yTez: tezDePiel

	^self new conNombre: unNombre colorDePelo: unColorDePelo formaDePelo: unaFormaDePelo colorDeOjos: unColorDeOjos yTez: tezDePiel.! !


!classDefinition: #Testigo category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #Testigo
	instanceVariableNames: 'ubicacion pistaDePais pistasDeAspecto'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!Testigo methodsFor: 'initializing' stamp: 'DJVANP 11/28/2020 13:44:26'!
conUbicacion: unPais 
	
	ubicacion _ unPais.
	unPais listaDeTestigos add: self.! !

!Testigo methodsFor: 'initializing' stamp: 'DJVANP 12/5/2020 18:02:11'!
initialize 
	
	pistasDeAspecto _ OrderedCollection new.
	pistaDePais _ nil.! !


!Testigo methodsFor: 'acciones' stamp: 'DJVANP 12/4/2020 18:27:25'!
agregarPistaDeRutaDe: unPais 
	
	pistaDePais  _ unPais.! !

!Testigo methodsFor: 'acciones' stamp: 'DJVANP 12/2/2020 16:46:00'!
agregarPistasDeAspecto: unaPista 
	
	pistasDeAspecto add: unaPista.! !


!Testigo methodsFor: 'accessing' stamp: 'DJVANP 12/7/2020 12:45:00'!
cantidadDePistasDeAspecto
	^ pistasDeAspecto size.! !

!Testigo methodsFor: 'accessing' stamp: 'DJVANP 11/30/2020 18:02:51'!
pistaDePais
	^ pistaDePais.! !

!Testigo methodsFor: 'accessing' stamp: 'DJVANP 11/30/2020 18:09:15'!
pistasDeAspecto
	^ pistasDeAspecto .! !

!Testigo methodsFor: 'accessing' stamp: 'DJVANP 11/19/2020 15:54:53'!
ubicacion
	^ ubicacion.! !


!Testigo methodsFor: 'testing' stamp: 'DJVANP 12/10/2020 01:07:34'!
tienePistasDeAspecto
	^pistasDeAspecto notEmpty .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Testigo class' category: 'TrabajoFinal-Entrega-Grupo2'!
Testigo class
	instanceVariableNames: ''!

!Testigo class methodsFor: 'instance creation' stamp: 'DJVANP 11/19/2020 15:55:31'!
conUbicacion: unPais 
	^self new conUbicacion: unPais. ! !


!classDefinition: #Viaje category: 'TrabajoFinal-Entrega-Grupo2'!
Object subclass: #Viaje
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!Viaje methodsFor: 'as yet unclassified' stamp: 'DJVANP 12/9/2020 23:39:47'!
tiempoDeViajePara: unDetective 

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Viaje class' category: 'TrabajoFinal-Entrega-Grupo2'!
Viaje class
	instanceVariableNames: ''!

!Viaje class methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/25/2020 15:56:11'!
desde: unPaisOrigen hacia: unPaisDestino

	self subclassResponsibility.! !

!Viaje class methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/26/2020 17:42:44'!
tipoDeViajePara: unDetective hacia: unPais 
	^ (self subclasses detect: [:tipoDeViaje | tipoDeViaje desde: (unDetective ubicacion) hacia: unPais]) new.! !


!classDefinition: #ViajeAPaisLimitrofe category: 'TrabajoFinal-Entrega-Grupo2'!
Viaje subclass: #ViajeAPaisLimitrofe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!ViajeAPaisLimitrofe methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/25/2020 15:37:46'!
tiempoDeViajePara: unDetective 
	
	^ ((unDetective tiempoDeViaje amount)/ 2) * hour.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ViajeAPaisLimitrofe class' category: 'TrabajoFinal-Entrega-Grupo2'!
ViajeAPaisLimitrofe class
	instanceVariableNames: ''!

!ViajeAPaisLimitrofe class methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/25/2020 15:53:33'!
desde: unPaisOrigen hacia: unPaisDestino 
	^ unPaisOrigen esLimitrofeDe: unPaisDestino.! !


!classDefinition: #ViajeAPaisNoLimitrofe category: 'TrabajoFinal-Entrega-Grupo2'!
Viaje subclass: #ViajeAPaisNoLimitrofe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Entrega-Grupo2'!

!ViajeAPaisNoLimitrofe methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/25/2020 15:38:49'!
tiempoDeViajePara: unDetective 
	^ unDetective tiempoDeViaje.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ViajeAPaisNoLimitrofe class' category: 'TrabajoFinal-Entrega-Grupo2'!
ViajeAPaisNoLimitrofe class
	instanceVariableNames: ''!

!ViajeAPaisNoLimitrofe class methodsFor: 'as yet unclassified' stamp: 'DJVANP 11/25/2020 15:54:15'!
desde: unPaisOrigen hacia: unPaisDestino 
	^ (unPaisOrigen esLimitrofeDe: unPaisDestino)not.! !
