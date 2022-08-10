//
//  MedRemCellView.swift
//  MedicationReminder
//
//  Created by Dair Alayev on 09.08.2022.
//

import SwiftUI

struct MedRemCellView: View {
    let med: MedRemModel
    let incrementNumOfMeds:() -> Void
    var body: some View {
        HStack {
            Button(action: incrementNumOfMeds, label: {
                Image(systemName: "plus.app")
            })
            Text("Taken: \(med.numOfMed)")
            Text("| \(med.time.hour ?? 0):\(med.time.minute ?? 0) |")
                .font(.headline)
            Text(med.title)
        }
    }
}

struct MedRemCellView_Previews: PreviewProvider {
    static var previews: some View {
        MedRemCellView(med: MedRemModel(title: "Ibuphen", time: Calendar.current.dateComponents([.hour, .minute], from: Date()), numOfMed: 0), incrementNumOfMeds: {})
    }
}
