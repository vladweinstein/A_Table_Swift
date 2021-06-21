//
//  Recipe_Widget.swift
//  Recipe Widget
//
//  Created by Vladimir Weinstein on 6/20/21.
//

import WidgetKit
import SwiftUI

import Foundation

extension FileManager {
  static func sharedContainerURL() -> URL {
    return FileManager.default.containerURL(
      forSecurityApplicationGroupIdentifier: "group.com.VladimirWeinstein.A-Table"
    )!
  }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct Recipe_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Image("applesaucefull")
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fill)
            .overlay(TextOverlay())
        
    }
}

struct TextOverlay: View {

    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.7), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text("Apple Compote")
                    .font(.title3)
                    .bold()
                Text("1 hour")
                    .font(.caption)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

@main
struct Recipe_Widget: Widget {
    let kind: String = "Recipe_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Recipe_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Featured Recipe")
        .description("Preview the latest featured recipes.")
        .supportedFamilies([.systemSmall])
    }
}

struct Recipe_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Recipe_WidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
