//
//  Comida.swift
//  Nutri
//
//  Created by Lívia Silva Oliveira on 09/03/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation

// let  Macarrao = Cadastro (nomeDoAlimento, valorDoP

class   Cadastro {
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
        
        //Pode-se escrever "self.nome = nome" no lugar de "nome = nomeDoAlimento"
        calcularTempo(quantidadeAdicionar: 12)
    }
    
    func calcularTempo(quantidadeAdicionar: Int) -> Int {
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
    
    
}

