//
//  AddMedViewModel.swift
//  MedicationReminder
//
//  Created by Dair Alayev on 09.08.2022.
//

import Foundation

class AddMedViewModel: ObservableObject {
    @Published var title: String = ""
    var time = DateComponents()
    
    func canSave() -> Bool {
        if title.isEmpty {
            return false
        }
        return true
    }
    
    func getMed(id: String = UUID().uuidString) -> MedRemModel {
        return MedRemModel(id: id, title: title, time: time, numOfMed: 0)
    }
}
