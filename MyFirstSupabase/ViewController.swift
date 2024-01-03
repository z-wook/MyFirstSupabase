//
//  ViewController.swift
//  MyFirstSupabase
//
//  Copyright (c) 2024 z-wook. All right reserved.
//

import Supabase
import UIKit

class ViewController: UIViewController {
    
    let supabase = SupabaseClient(
        supabaseURL: URL(string: PROJECT_URL)!,
        supabaseKey: PROJECT_API_KEYS
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
//        insertData()
//        fetchData()
//        upsertData()
//        deleteData()
    }
}

private extension ViewController {
    func configure() {
        view.backgroundColor = .systemBackground
    }
    
    func insertData() {
        let test = Test(title: "insert", body: "insert Data")
        
        Task {
            try await supabase.database
                .from("page")
                .insert(test)
                .execute()
        }
    }
    
    func fetchData() {
        Task {
            let test: [Test] = try await supabase.database
                .from("page")
                .select()
                .execute()
                .value
            
            print(test)
        }
    }
    
    func upsertData() {
        let test = Test(id: 3, title: "upsert", body: "upsert Data")
        
        Task {
            try await supabase.database
                .from("page")
                .upsert(test)
                .execute(options:)
        }
    }
    
    func deleteData() {
        Task {
            try await supabase.database
              .from("page")
              .delete()
              .eq("id", value: 3)
              .execute()
        }
    }
}
