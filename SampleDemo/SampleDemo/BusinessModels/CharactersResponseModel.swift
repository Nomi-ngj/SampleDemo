//
//  CharactersResponseModel.swift
//  SampleDemo
//
//  Created by Nouman Gul Junejo on 28/04/2023.
//

import Foundation

// MARK: - CharactersResponseModel
struct CharactersResponseModel: Decodable {
    let abstract, abstractSource, abstractText: String
    let abstractURL: String
    let answer, answerType, definition, definitionSource: String
    let definitionURL, entity, heading, image: String
    let imageHeight, imageIsLogo, imageWidth: Int
    let infobox, redirect: String
    let relatedTopics: [RelatedTopic]
    let type: String

    enum CodingKeys: String, CodingKey {
        case abstract = "Abstract"
        case abstractSource = "AbstractSource"
        case abstractText = "AbstractText"
        case abstractURL = "AbstractURL"
        case answer = "Answer"
        case answerType = "AnswerType"
        case definition = "Definition"
        case definitionSource = "DefinitionSource"
        case definitionURL = "DefinitionURL"
        case entity = "Entity"
        case heading = "Heading"
        case image = "Image"
        case imageHeight = "ImageHeight"
        case imageIsLogo = "ImageIsLogo"
        case imageWidth = "ImageWidth"
        case infobox = "Infobox"
        case redirect = "Redirect"
        case relatedTopics = "RelatedTopics"
        case type = "Type"
    }
}

// MARK: - RelatedTopic
struct RelatedTopic: Decodable {
    let firstURL: String
    let icon: Icon
    let result, text: String

    enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case icon = "Icon"
        case result = "Result"
        case text = "Text"
    }
}

// MARK: - Icon
struct Icon: Decodable {
    let height, url, width: String

    enum CodingKeys: String, CodingKey {
        case height = "Height"
        case url = "URL"
        case width = "Width"
    }
}
