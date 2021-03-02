//
//  SettingsView.swift
//  todo app
//
//  Created by Ivan Mosquera on 28/2/21.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var iconSettings: IconName
    
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings()
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            VStack(alignment:.center, spacing: 0){
                // MARK: - Form
                Form{
                    
                    // MARK: - Section 1
                    Section(header: Text("App icon")){
                        
                        Picker(selection: $iconSettings.currentIndex, label:
                                
                                HStack {
                                    ZStack {
                                        
                                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                                            .strokeBorder(Color.primary, lineWidth: 2)
                                            
                                        Image(systemName: "paintbrush")
                                            .font(.system(size: 28, weight: .regular, design: .default))
                                            .foregroundColor(Color.primary)
                                    }
                                    .frame(width: 44, height: 44)
                                    
                                    Text("App icons".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.primary)
                                })//: Label
                        {
                            ForEach(0..<iconSettings.iconNames.count){ index in
                                
                                HStack{
                                    Image(uiImage: UIImage(named: self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 44, height: 44)
                                        .cornerRadius(8)
                                    
                                    Spacer().frame(width: 8)
                                    
                                    Text(iconSettings.iconNames[index] ?? "Blue")
                                        .frame(alignment: .leading)
                                        
                                }//: HStack
                                .padding(3)
                            }//: Loop
                        }//: Picker
                        .onReceive([iconSettings.currentIndex].publisher.first()){ (value) in
                            
                            //Index current icon.
                            let index = iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                            
                            // Set if the selected value is different.
                            if index != value {
                                UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
                                    
                                    if let error = error {
                                        print(error.localizedDescription)
                                    }else{
                                        print("Success!")
                                    }
                                }
                            }
                        }
                    }//: Section 1
                    .padding(.vertical, 3)
                    
                    // MARK: - Section 2
                    Section(
                        header:
                            
                            HStack {
                                Text("App Theme")
                                
                                Image(systemName:"circle.fill")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(themes[self.theme.themeSettings].themeColor)
                                    
                            }){
                        List{
                            ForEach(themes, id: \.id){ item in
                                
                                Button(action:{
                                    self.theme.themeSettings = item.id
                                    UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme" )
                                }){
                                    HStack {
                                        Image(systemName:"circle.fill")
                                            .foregroundColor(item.themeColor)
                                        
                                        Text(item.themeName)
                                    }
                                }//: Button
                                .accentColor(Color.primary)
                            }
                        }
                    }//: Section 2
                    .padding(.vertical, 3)
                    
                    
                    // MARK: - Section 3
                    Section(header:Text("Social media")){
                        FormRowLinkView(icon: "globe", color: Color.green, text: "Website", link: "https://swift.org")
                        
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://twitter.com")
                        
                        FormRowLinkView(icon: "camera.fill", color: Color.pink, text: "Instagram", link: "https://instagram.com")
                    }//: Section 3
                    .padding(.vertical, 3)
                    
                    // MARK: - Section 4
                    Section(header: Text("About the app")){
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Ivan")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Ivan")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0")
                    }//: Section 4
                    .padding(.vertical, 3)
                    
                }//: Form
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - Footer
                Text("Copyright © all rights reserved.")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(.secondary)
                
            }//: VStack
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
            .navigationBarItems(trailing:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "xmark.circle")
                        .accentColor(themes[self.theme.themeSettings].themeColor)
                        .imageScale(.large)
                }
            )
        }//: Navigation
    }
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.light)
            .environmentObject(IconName())
    }
}
