//
//  FalseCognates.swift
//  CiaoItalia
//
//  Created by Pedro Fernandes Barreto Costa on 08/05/25.
//

struct FalseCognates: Expressions {
    var expressionList: [ExpressionInfo] = [
        ExpressionInfo(
            italian: "Camera",
            translation: "É \"quarto\", e não \"câmera fotográfica\".",
            keywords: ["dormir", "hotel", "quarto", "confundir"]
        ),
        ExpressionInfo(
            italian: "Bravo",
            translation: "Significa \"bom\", \"habilidoso\", e não \"corajoso\".",
            keywords: ["parabéns", "legal", "elogio"]
        ),
        ExpressionInfo(
            italian: "Morbido",
            translation: "Quer dizer \"macio\", e não \"mórbido\".",
            keywords: ["suave", "toque"]
        ),
        ExpressionInfo(
            italian: "Pretendere",
            translation: "Achar que algo é merecido ou esperado, não significa \"pretender\".",
            keywords: ["esperar", "supor"]
        ),
        ExpressionInfo(
            italian: "Salire",
            translation: "Significa \"subir\", não \"sair\".",
            keywords: ["subir", "escada", "movimento"]
        ),
        ExpressionInfo(
            italian: "Attendere",
            translation: "Quer dizer \"esperar\", não \"atender\".",
            keywords: ["esperar", "aguardar", "tempo"]
        ),
        ExpressionInfo(
            italian: "Fattoria",
            translation: "É \"fazenda\", não \"fábrica\".",
            keywords: ["campo", "rural", "animais"]
        ),
        ExpressionInfo(
            italian: "Rumore",
            translation: "Quer dizer \"barulho\", e não \"rumor\".",
            keywords: ["som", "ruído", "alto", "ambiente"]
        ),
        ExpressionInfo(
            italian: "Educazione",
            translation: "Refere-se à \"boa conduta\", e não à \"educação escolar\".",
            keywords: ["respeito", "comportamento", "etiqueta"]
        ),
        ExpressionInfo(
            italian: "Eventualmente",
            translation: "Quer dizer \"talvez\", e não \"eventualmente\".",
            keywords: ["possibilidade", "dúvida", "talvez", "confusão"]
        ),
        ExpressionInfo(
            italian: "Confrontare",
            translation: "Significa \"comparar\", não \"confrontar\" no sentido de brigar.",
            keywords: ["comparar", "análise", "diferença", "confundir"]
        )
    ]
    var title = "Falsos Cognatos"
}
