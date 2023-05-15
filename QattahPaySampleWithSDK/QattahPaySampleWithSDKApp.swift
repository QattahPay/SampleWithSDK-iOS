//
//  QattahPaySampleWithSDKApp.swift
//  QattahPaySampleWithSDK
//
//  Created by khlafawi on 11/05/2023.
//

import SwiftUI
import qattahpay_ios_sdk

@main
struct QattahPaySampleWithSDKApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(qattahPay: QattahPaySDK(apiKey: "<YOUR_API_HERE>")))
        }
    }
}
