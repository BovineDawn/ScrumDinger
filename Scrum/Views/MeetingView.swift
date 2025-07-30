//
//  ContentView.swift
//  Scrum
//
//  Created by JG on 7/28/25.
//

import SwiftUI
import TimerKit
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @State var scrumTimer = ScrumTimer()
    
    private let player = AVPlayer.dingPlayer()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
//                ProgressView(value: 5, total: 15)
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text("Seconds Elapsed")
//                            .font(.caption)
//                        Label("300", systemImage: "hourglass.tophalf.fill")
//                    }
//                    Spacer()
//                    VStack(alignment: .trailing) {
//                        Text("Seconds Remaining")
//                            .font(.caption)
//                        Label("600", systemImage: "hourglass.bottomhalf.fill")
//                    }
//                }
//                .accessibilityElement(children: .ignore)
//                .accessibilityLabel("Time remaining")
//                .accessibilityValue("10 minutes")
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
                }
            }
            .padding()
            .foregroundColor(scrum.theme.accentColor)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendeeNames: scrum.attendees.map { $0.name})
                scrumTimer.speakerChangedAction = {
                    player.seek(to: .zero)
                }
                scrumTimer.startScrum()
            }
            .onDisappear {
                scrumTimer.stopScrum()
            }
        }
    }


#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: $scrum)
}
