//
//  Ingredient.swift
//  iVegi
//
//  Created by Павел Барташов on 06.02.2022.
//

struct Ingredient {
    let title: String
    let amount: Float //TODO иногда встречается диапазон значений. Может использовать range или minAmount и maxAmount
    let piece: Piece
}
