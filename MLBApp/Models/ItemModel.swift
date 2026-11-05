import Foundation

struct ItemModel: Identifiable, Hashable {
    let id: Int
    let name: String
    let team: String
    let position: String
    let number: Int
    let country: String
    let biography: String

    var subtitle: String { "\(team) · \(position)" }
    var imageName: String { "player-\(id)" }
}

extension ItemModel {
    static let samples: [ItemModel] = [
        ItemModel(
            id: 660271,
            name: "Shohei Ohtani",
            team: "Los Angeles Dodgers",
            position: "Bateador designado",
            number: 17,
            country: "Japón",
            biography: "Shohei Ohtani combina el poder al bate con una capacidad excepcional como lanzador. En 2024 se convirtió en el primer jugador de MLB en alcanzar 50 jonrones y 50 bases robadas en una misma temporada.\n\nCon Los Angeles Dodgers conquistó la Serie Mundial de 2024 y fue elegido Jugador Más Valioso de la Liga Nacional de manera unánime. Su disciplina y versatilidad lo han convertido en una de las figuras más reconocidas del béisbol."
        ),
        ItemModel(
            id: 592450,
            name: "Aaron Judge",
            team: "New York Yankees",
            position: "Jardinero",
            number: 99,
            country: "Estados Unidos",
            biography: "El capitán de los Yankees destaca por su poder ofensivo y su defensa en los jardines. Su presencia en el plato lo ha convertido en una figura central del equipo de New York.\n\nEn 2022 estableció el récord de la Liga Americana con 62 jonrones. En 2024 volvió a recibir el premio al Jugador Más Valioso de su liga, después de una temporada sobresaliente."
        ),
        ItemModel(
            id: 605141,
            name: "Mookie Betts",
            team: "Los Angeles Dodgers",
            position: "Campocorto / jardinero",
            number: 50,
            country: "Estados Unidos",
            biography: "Mookie Betts destaca tanto por su bate como por su capacidad para defender distintas posiciones. Su velocidad y lectura del juego lo distinguen como uno de los jugadores más completos de su generación.\n\nGanador del premio MVP de la Liga Americana en 2018, sumó con los Dodgers otro título de Serie Mundial en 2024. Su versatilidad ha sido una pieza importante en el rendimiento de Los Angeles."
        ),
        ItemModel(
            id: 665742,
            name: "Juan Soto",
            team: "New York Mets",
            position: "Jardinero",
            number: 22,
            country: "República Dominicana",
            biography: "Juan Soto es reconocido por su selección de lanzamientos y por combinar paciencia y poder al bate. Fue campeón de la Serie Mundial de 2019 con Washington.\n\nDespués de disputar la temporada 2024 con los Yankees, se incorporó a los Mets en 2025. El dominicano se ha consolidado como uno de los bateadores más destacados de su generación."
        ),
        ItemModel(
            id: 660670,
            name: "Ronald Acuña Jr.",
            team: "Atlanta Braves",
            position: "Jardinero",
            number: 13,
            country: "Venezuela",
            biography: "Ronald Acuña Jr. combina velocidad, potencia y un brazo destacado en los jardines. El venezolano es una de las figuras de los Atlanta Braves.\n\nEn 2023 se convirtió en el primer jugador en alcanzar 40 jonrones y 70 bases robadas en una misma temporada, una actuación que le permitió recibir el premio al Jugador Más Valioso de la Liga Nacional."
        ),
        ItemModel(
            id: 547180,
            name: "Bryce Harper",
            team: "Philadelphia Phillies",
            position: "Primera base",
            number: 3,
            country: "Estados Unidos",
            biography: "Bryce Harper se caracteriza por su intensidad y capacidad para responder en momentos decisivos. Su poder al bate lo convirtió desde joven en una de las figuras más reconocidas de MLB.\n\nDos veces Jugador Más Valioso de la Liga Nacional, se consolidó como primera base de los Phillies. Su liderazgo y conexión con la afición de Philadelphia forman parte de la identidad del equipo."
        ),
        ItemModel(
            id: 596019,
            name: "Francisco Lindor",
            team: "New York Mets",
            position: "Campocorto",
            number: 12,
            country: "Puerto Rico",
            biography: "Francisco Lindor aporta defensa de alto nivel y producción ofensiva desde el campocorto. Conocido como Mr. Smile, es uno de los líderes de los New York Mets.\n\nEl puertorriqueño fue protagonista en el recorrido del equipo hacia la postemporada de 2024. Su habilidad para batear desde ambos lados del plato complementa su gran lectura defensiva."
        ),
        ItemModel(
            id: 665487,
            name: "Fernando Tatis Jr.",
            team: "San Diego Padres",
            position: "Jardinero",
            number: 23,
            country: "República Dominicana",
            biography: "Fernando Tatis Jr. destaca por su velocidad, potencia y brazo en el jardín derecho. El dominicano se ha convertido en una de las figuras más reconocidas de los San Diego Padres.\n\nSu estilo atlético y su entusiasmo representan una forma dinámica de jugar al béisbol. Su capacidad para intervenir tanto en el ataque como en la defensa lo convierte en un jugador importante para el equipo."
        )
    ]
}
