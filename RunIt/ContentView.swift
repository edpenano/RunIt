//
//  ContentView.swift
//  RunIt
//
//  Created by Ed Penano on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            WorkoutSectionView(sectionTitle: "Workouts", numberOfWorkouts: 5)
                .tabItem {
                    Label("Workouts", systemImage: "figure.walk")
                }
                .tag(0)
            
            WorkoutSectionView(sectionTitle: "Evening Workouts", numberOfWorkouts: 3)
                .tabItem {
                    Label("Evening", systemImage: "moon.stars")
                }
                .tag(1)
        }
    }
}

struct WorkoutSectionView: View {
    let sectionTitle: String
    let numberOfWorkouts: Int
    @State private var showingAboutMe = false
    @State private var showingEmailLink = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<numberOfWorkouts) { _ in
                    NavigationLink(destination: WorkoutDetailView()) {
                        HStack {
                           Image(systemName: "figure.walk")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text("Workout Title")
                                    .font(.headline)
                                Text("Duration: 30 mins")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationTitle(sectionTitle)
            .toolbar {
                Menu {
                    Button("About Me", action: { showingAboutMe = true })
                    Button("Email Us", action: { showingEmailLink = true })
                } label: {
                    Image(systemName: "line.3.horizontal")
                }
            }
            .sheet(isPresented: $showingAboutMe) {
                AboutMeView(showingAboutMe: $showingAboutMe)
            }
            .sheet(isPresented: $showingEmailLink) {
                EmailLinkView(showingEmailLink: $showingEmailLink)
            }
        }
    }
}

struct AboutMeView: View {
    @Binding var showingAboutMe: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("About Me")
                    .font(.title)
                    .padding()
                Text("This is a placeholder for the About Me details.")
                    .padding()
                Spacer()
            }
            .navigationBarTitle("About Me", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                showingAboutMe = false
            })
        }
    }
}

struct EmailLinkView: View {
    @Binding var showingEmailLink: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Email Us")
                    .font(.title)
                    .padding()
                Text("Please send your inquiries to: support@example.com")
                    .padding()
                Spacer()
            }
            .navigationBarTitle("Contact Us", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                showingEmailLink = false
            })
        }
   }
}

struct WorkoutDetailView: View {
    var body: some View {
        VStack {
            Text("Workout Details")
                .font(.largeTitle)
            Spacer()
            Image("duck") // Placeholder for workout image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)
            Spacer()
            Button("Start Workout") {
                // Start workout action
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
