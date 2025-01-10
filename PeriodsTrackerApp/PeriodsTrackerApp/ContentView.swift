//
//  ContentView.swift
//  PeriodsTrackerApp
//
//  Created by Julia Martcenko on 09/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		VStack {
			HStack {
				Spacer() // Push items to the edges

				// Date display
				DateView()
					.padding(.horizontal)

				Spacer() // Push items to the edges

				// Settings icon
				Image(systemName: "gear")
					.padding(.horizontal)
					.onTapGesture {
						// Action for settings
						print("Settings tapped")
					}
			}
			.padding()
			PeriodsDayView()
			Spacer()
			DescriptionView(menstruationDataModel: MenstruationDataModel(nextPeriodDate: Date()))
				.padding(.vertical)
			Button("Menstruation came early") {
				print("Did tab")
			}
			Spacer()
        }
        .padding()
    }
}

struct DateView: View {
	let currantDate = Date()

	var body: some View {
			Text(currantDate, format: Date.FormatStyle().month().day().weekday())
	}
}

struct PeriodsDayView: View {
	let menstruationDate = Date()

	var body: some View {
		VStack {
			//iOS 15
			Text(menstruationDate, format: Date.FormatStyle().day()).font(.system(size: 200)).foregroundColor(.red)
			Text("Days until menstruation")
		}
	}
}

struct DescriptionView: View {
	let menstruationDataModel: MenstruationDataModel

	var body: some View {
		VStack {
			DescriptioRowView(title: "Next menstruation", value: "23.01.2025", isLast: false)
			DescriptioRowView(title: "Ovulation", value: "23.01.2025", isLast: false)
			DescriptioRowView(title: "Fertility", value: "23.01.2025", isLast: true)
		}
	}
}

struct DescriptioRowView: View {
	let title: String
	let value: String
	let isLast: Bool

	var body: some View {
		VStack {
			HStack {
				Text(title).font(.system(size: 16))
				Spacer()
				Text(value).font(.system(size: 16))
			}
			if !isLast {
				RoundedRectangle(cornerRadius: 12).frame(height: 1)
			}
		}
	}
}

#Preview {
    ContentView()
}
