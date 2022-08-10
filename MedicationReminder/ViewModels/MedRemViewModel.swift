//
//  MedRemViewModel.swift
//  MedicationReminder
//
//  Created by Dair Alayev on 09.08.2022.
//

import Foundation

class MedRemViewModel: ObservableObject {
    @Published var medsList: [MedRemModel] = []
    
    
    func onMove(indexSet: IndexSet, to: Int) {
        medsList.move(fromOffsets: indexSet, toOffset: to)
    }
    
    func onDelete(indexSet: IndexSet) {
        medsList.remove(atOffsets: indexSet)
    }
    
    func onSave(item: MedRemModel) {
        if let index = medsList.firstIndex(where: {$0.id == item.id}) {
            medsList[index] = item
            return
        }
        medsList.append(item)
    }
    
    func update(item: MedRemModel) {
        if let index = medsList.firstIndex(where: {$0.id == item.id}) {
            medsList[index] = item
        }
    }
}
