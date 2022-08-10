//
//  AddMedView.swift
//  MedicationReminder
//
//  Created by Dair Alayev on 09.08.2022.
//
import SwiftUI

struct AddMedView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let onSave: (_ medRem: MedRemModel) -> Void
    let id: String = UUID().uuidString
    @StateObject var addMedVM = AddMedViewModel()
    @State var currentTime = Date()
    
    var body: some View {
        VStack {
            ScrollView {
                TextField("Type medicine name", text: $addMedVM.title)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                    .onSubmit {
                        onSaveClick()
                    }
                DatePicker("Pick a time to get medicine", selection: $currentTime, displayedComponents: .hourAndMinute)
            }
            
            Button {
                if addMedVM.canSave() {
                    onSaveClick()
                }
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
                    .background(.primary)
                    .cornerRadius(12)
            }
        }.navigationTitle("Add Med")
        .padding()
    }
    
    func onSaveClick() {
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: currentTime)
        addMedVM.time = dateComponents
        let medRem: MedRemModel = addMedVM.getMed(id: id)
        onSave(medRem)

        NotificationManager.instance.scheduleNotification(title: addMedVM.title, dateComponents: dateComponents)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddMedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddMedView { medRem in
                
            }
        }
    }
}

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAutorization() {
        let options: UNAuthorizationOptions = [.alert, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("error \(error) occured")
            }
        }
    }
    
    func scheduleNotification(title: String, dateComponents: DateComponents) {
        
        let content = UNMutableNotificationContent()
        content.title = "Important!"
        content.subtitle = "Please take your \(title)!"
        content.sound = .default
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        
        UNUserNotificationCenter.current().add(request)
    }
}
