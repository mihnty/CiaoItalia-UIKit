//
//  EatAndDrink.swift
//  CiaoItalia
//
//  Created by Pedro Fernandes Barreto Costa on 08/05/25.
//

struct EatAndDrink: Expressions {
    var expressionList: [ExpressionInfo] = [
        ExpressionInfo(
            italian: "Mangiare",
            translation: "Verbo que significa \"comer\", usado em muitas situações do dia a dia.",
            keywords: ["comer", "refeição", "alimento"]
        ),
        ExpressionInfo(
            italian: "Bere",
            translation: "Verbo que significa \"beber\", útil para pedir bebidas em cafés e restaurantes.",
            keywords: ["beber", "bebida", "tomar"]
        ),
        ExpressionInfo(
            italian: "Vorrei",
            translation: "Significa \"eu gostaria de\", forma educada para fazer pedidos.",
            keywords: ["gostaria", "quero", "pedir"]
        ),
        ExpressionInfo(
            italian: "Il menù, per favore",
            translation: "Frase comum para pedir o cardápio em restaurantes.",
            keywords: ["cardápio", "menu", "comida", "restaurante"]
        ),
        ExpressionInfo(
            italian: "Il conto, per favore",
            translation: "Usada para solicitar a conta após a refeição.",
            keywords: ["conta", "pagar", "fechar"]
        ),
        ExpressionInfo(
            italian: "Quanto costa?",
            translation: "Pergunta para saber o preço de algo. Usada em restaurantes e mercados.",
            keywords: ["preço", "valor", "quanto", "custa"]
        ),
        ExpressionInfo(
            italian: "Avete...?",
            translation: "Significa \"vocês têm...?\", útil para perguntar sobre produtos ou itens.",
            keywords: ["vocês têm", "tem", "procurar", "encontrar"]
        ),
        ExpressionInfo(
            italian: "Mi può aiutare?",
            translation: "\"Você pode me ajudar?\" — para pedir ajuda em uma loja ou mercado.",
            keywords: ["ajuda", "pode", "pedir", "favor"]
        ),
        ExpressionInfo(
            italian: "Posso assaggiare?",
            translation: "\"Posso experimentar?\" — útil quando for provar algo antes de comprar.",
            keywords: ["experimentar", "provar", "degustar", "amostra"]
        ),
        ExpressionInfo(
            italian: "Pane",
            translation: "Pão. Um alimento básico servido com frequência em refeições italianas.",
            keywords: ["pão", "padaria"]
        ),
        ExpressionInfo(
            italian: "Formaggio",
            translation: "Queijo. Muito presente na culinária italiana.",
            keywords: ["queijo", "laticínio"]
        ),
        ExpressionInfo(
            italian: "Acqua naturale",
            translation: "Água sem gás. Geralmente é oferecida junto com a com gás (frizzante).",
            keywords: ["água", "sem gás", "beber"]
        ),
        ExpressionInfo(
            italian: "Caffè",
            translation: "Café. Pode se referir a um expresso, muito popular na Itália.",
            keywords: ["café", "espresso"]
        ),
        ExpressionInfo(
            italian: "Birra",
            translation: "Cerveja. Disponível em bares e mercados.",
            keywords: ["cerveja", "bebida", "alcoólica"]
        )
    ]
    var title = "Comer & Beber"
}
