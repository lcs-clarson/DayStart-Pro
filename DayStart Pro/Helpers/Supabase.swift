//
//  Supabase.swift
//  DayStart Pro
//
//  Created by Charlie Larson on 2024-06-07.
//

import Foundation
import Supabase

class SupabaseManager {
    static let supabaseUrl = "https://mridogtrjowhdwksnnqs.supabase.co"
    static let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1yaWRvZ3Ryam93aGR3a3NubnFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTc2ODExNjYsImV4cCI6MjAzMzI1NzE2Nn0.ciOxs2Gr_7hmfaaP63VwMaKhdprVH4HJa1hE-M16t8w"
    
    static func createClient() -> SupabaseClient? {
        return SupabaseClient(supabaseURL: URL(string: supabaseUrl)!, supabaseKey: supabaseKey)
    }
}
