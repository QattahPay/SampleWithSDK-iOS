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
                
                NavigationLink(destination: QattahWebView(qattahResponse: viewModel.qattahResponse, qattahPaymentCallback: QattahPaymentCallback()), isActive: $viewModel.navigatToQattahWebView) {
                    EmptyView()
                }

                Button(action: {
                    
                    viewModel.payWithQattahPay(amount: 120, currency: Currency.SAR, orderId: "123", description: "order", userEmail: "user@email.com", userPhoneNumber: "0501234567", language: Language.EN, theme: Theme.DARK, isSandbox: true, onSuccess: {
                        qattahResponse in
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
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(qattahPay: QattahPaySDK(apiKey: "3|6h23MomrETvHZZ8UpSjr7ThCJ1zxsxIjLkFD4FGP")))
    }
}
