//
//  ContentView.swift
//  QattahPaySampleWithSDK
//
//  Created by khlafawi on 11/05/2023.
//

import SwiftUI
import qattahpay_ios_sdk

struct ContentView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Button(action: {
                    
                    viewModel.payWithQattahPay(amount: 120, currency: Currency.SAR, orderId: "123", description: "order", userEmail: "user@email.com", userPhoneNumber: "0501234567", language: Language.EN, theme: Theme.DARK, isSandbox: true, onSuccess: {
                        qattahResponse in
                        viewModel.qattahWebView = QattahWebView(qattahResponse: qattahResponse, qattahPaymentCallback: QattahPaymentCallback())
                        viewModel.navigatToQattahWebView = true
                    }, onFail: {
                        errorMessage in
                        print(errorMessage)
                    })
                    
                }, label: {
                    Text("Pay with Qattah Pay")
                            .fontWeight(.bold)
                            .frame(width: 300, height: 40)
                            .foregroundColor(.blue)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                })
                .navigationDestination(isPresented: $viewModel.navigatToQattahWebView) {
                    viewModel.qattahWebView
                }
            }
            .padding()
        }
    }
}
