//
//  SettingsPage.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/9/21.
//

import SwiftUI
import MessageUI

struct SettingsPage: View {
    
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    @State private var isShowingMailView = false
    
    var body: some View {
        NavigationView {
            
            List {
                Section(header: Text("Legal & Acknowledgments")) {
                    NavigationLink(destination: LegalText()) {
                        Label {
                            Text("Legal")
                                
                        } icon: {
                            Image(systemName: "doc.text.magnifyingglass")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.brown, .yellow)
                        }
                    }
                    NavigationLink(destination: AppCredits()) {
                        Label {
                            Text("Acknowledgments")
                                
                        } icon: {
                            Image(systemName: "chevron.left.forwardslash.chevron.right")
                                .foregroundStyle(.yellow)
                        }
                    }
                }
                Section(header: Text("Recipe Submission")
                            ) {
                Button(action: {
                    if MFMailComposeViewController.canSendMail() {
                        self.isShowingMailView.toggle()
                    } else {
                        print("Can't send emails from this device")
                    }
                    if result != nil {
                        print("Result: \(String(describing: result))")
                    }
                }) {
                    Label {
                        Text("Share a recipe / new feature request")
                            
                    } icon: {
                        Image(systemName: "fork.knife")
                            .foregroundStyle(.yellow)
                    }
                }
                // .disabled(!MFMailComposeViewController.canSendMail())
                Image("vladcooks")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                    .padding(.trailing, 10)
            }
            }
            
            .sheet(isPresented: $isShowingMailView) {
                MailView(result: $result) { composer in
                    composer.setSubject("Recipe Suggestion")
                    composer.setToRecipients(["vlad@vladw.com"])
                }
            }
            
            .navigationTitle("Settings")
            Spacer()
        
            
        }
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
        
    }
}
