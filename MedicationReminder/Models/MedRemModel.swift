//
//  MedRemModel.swift
//  MedicationReminder
//
//  Created by Dair Alayev on 09.08.2022.
//

import Foundation

struct MedRemModel: Identifiable {
    let id: String
    let title: String
    let time: DateComponents
    var numOfMed: Int
    
    init(id: String = UUID().uuidString, title: String, time: DateComponents, numOfMed: Int) {
        self.id = id
        self.title = title
        self.time = time
        self.numOfMed = numOfMed
        
    }
    
    func incrementNumOfMeds() -> MedRemModel {
        return MedRemModel(id: id, title: title, time: time, numOfMed: numOfMed+1)
    }
}
