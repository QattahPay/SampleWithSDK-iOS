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
            ContentView(viewModel: ContentViewModel(qattahPay: QattahPaySDK(apiKey: "3|6h23MomrETvHZZ8UpSjr7ThCJ1zxsxIjLkFD4FGP")))
        }
    }
}
