//
//  MedRemView.swift
//  MedicationReminder
//
//  Created by Dair Alayev on 09.08.2022.
//

import SwiftUI

struct MedRemView: View {
    @StateObject var medRemVM = MedRemViewModel()
    
    var body: some View {
        List {
            ForEach(medRemVM.medsList) { item in
                MedRemCellView(med: item, incrementNumOfMeds: {
                    medRemVM.update(item: item.incrementNumOfMeds())
                })
            }.onDelete(perform: medRemVM.onDelete).onMove(perform: medRemVM.onMove)
        }.navigationTitle("Medications")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: {
                AddMedView { med in
                    medRemVM.onSave(item: med)
                }
            }, label: {
                Text("Add med")
            }))
            .onAppear {
                NotificationManager.instance.requestAutorization()
            }
    }
}

struct MedRemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MedRemView()
        }
    }
}
