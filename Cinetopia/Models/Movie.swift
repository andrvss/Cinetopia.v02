//
//  Movie.swift
//  Cinetopia
//
//  Created by Paulo Andres on 21/06/24.
//

import Foundation

class Movie: Decodable {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
    private(set) var isSelected: Bool? = false
    
    // MARK: - Class methods
    
    func changeSelectionStatus() {
        isSelected = !(isSelected ?? false)
    }
}

//let movies: [Movie] = [
//    Movie(id: 1, title: "Avatar", image: "https://github.com/giovannamoeller/movie-api/blob/main/images/avatar.jpg?raw=true", synopsis: "No exuberante mundo alienígena de Pandora vivem os Na'vi, seres que parecem ser primitivos, mas são altamente evoluídos. Como o ambiente do planeta é tóxico, foram criados os avatares, corpos biológicos controlados pela mente humana que se movimentam livremente em Pandora. Jake Sully, um ex-fuzileiro naval paralítico, volta a andar através de um avatar e se apaixona por uma Na'vi. Esta paixão leva Jake a lutar pela sobrevivência de Pandora.", rate: 9.4, releaseDate: "18/12/2009"),
//    Movie(id: 2, title: "Vingadores Ultimato", image: "https://github.com/giovannamoeller/movie-api/blob/main/images/vingadores-ultimato.jpg?raw=true", synopsis: "Após Thanos eliminar metade das criaturas vivas, os Vingadores têm de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espaço sem água e comida, Steve Rogers e Natasha Romanov lideram a resistência contra o titã louco.", rate: 9.2, releaseDate: "25/04/2019"),
//    Movie(id: 3, title: "Harry Potter e as Relíquias da Morte - Parte 2", image: "https://github.com/giovannamoeller/movie-api/blob/main/images/avatar-2.jpg?raw=true", synopsis: "A batalha entre as forças do bem e do mal da magia alcançam o mundo dos trouxas. O risco nunca foi tão grande, e ninguém está seguro. Harry Potter precisa fazer um sacrifício final conforme o confronto com Lord Voldemort se aproxima.", rate: 9.5, releaseDate: "15/07/2011"),
//]
