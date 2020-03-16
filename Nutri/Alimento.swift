//
//  Alimento.swift
//  Nutri
//
//  Created by Lívia Silva Oliveira on 10/03/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation

class   Alimento {
    var nome: String
    var peso: Int
    var pessoas: Int
    var estado: String
    var modo: String
    
    init (nomeDoAlimento: String, valorDoPeso: Int, quantidadeDePessoas: Int, estadoDoAlimento: String, modoDePreparo: String) {
        nome = nomeDoAlimento
        peso = valorDoPeso
        pessoas = quantidadeDePessoas
        estado = estadoDoAlimento
        modo = modoDePreparo
        
    }
    
    func calculoPicker(quantidadeAdicionar: Int) -> Int {
        let calcularTempo: Int
        calcularTempo = (peso * pessoas) + checarEstadoDoAlimento(quantidadeAdicionar: quantidadeAdicionar)
        return calcularTempo
    }
    
    func checarEstadoDoAlimento(quantidadeAdicionar: Int) -> Int {
        var tempoDoAlimento: Int = 0
        
        if self.estado == "congelado"{
            tempoDoAlimento = quantidadeAdicionar
        }
        else if self.estado == "cru"{
            tempoDoAlimento = -quantidadeAdicionar
        }
        return tempoDoAlimento
        
    }
    
    
    //   // func checarMododoAlimento() -> Int {
    //        var tempoDoAlimento: Int = 0
    //
    //        if self.modo == "assar"{
    //            tempoDoAlimento =
    //        }
    //
    //        else if self.modo == "cozir"{
    //            tempoDoAlimento =
    //        }
    //
    //        else self.modo == "cru"{
    //
    //        }
    
    
}

//}var Macarrao = Alimento(nomeDoAlimento: "Macarrao", valorDoPeso: 2, quantidadeDePessoas: 3, estadoDoAlimento: "cru", modoDePreparo: "cozir")
//print(Macarrao.calcularTempo(quantidadeAdicionar: 4))

