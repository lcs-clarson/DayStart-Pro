//
//  RemindersViewModel.swift
//  DayStart Pro
//
//  Created by Charlie Larson on 2024-06-10.
//

import Foundation
import Supabase

@MainActor
class RemindersViewModel: ObservableObject {
    @Published var reminders: [String] = []
    private var supabase: SupabaseClient?

    init() {
        self.supabase = SupabaseManager.createClient()
        fetchReminders()
    }

    func fetchReminders() {
        Task {
            do {
                let response = try await supabase?.from("reminders").select().execute()
                if let data = response?.data as? [[String: Any]] {
                    reminders = data.compactMap { $0["text"] as? String }
                }
            } catch {
                print("Error fetching reminders: \(error.localizedDescription)")
            }
        }
    }

    func addReminder(_ reminder: String) {
        Task {
            do {
                let response = try await supabase?.from("reminders").insert(["text": reminder]).execute()
                if response?.data != nil {
                    reminders.append(reminder)
                }
            } catch {
                print("Error adding reminder: \(error.localizedDescription)")
            }
        }
    }

    func deleteReminder(_ reminder: String) {
        Task {
            do {
                let response = try await supabase?.from("reminders").delete().eq("text", value: reminder).execute()
                if response?.data != nil {
                    reminders.removeAll { $0 == reminder }
                }
            } catch {
                print("Error deleting reminder: \(error.localizedDescription)")
            }
        }
    }
}
