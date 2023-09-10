//
//  ContentViewModel.swift
//  QattahPaySampleWithSDK
//
//  Created by khlafawi on 12/05/2023.
//

import Foundation
import qattahpay_ios_sdk

final class ContentViewModel: ObservableObject {
    
    private var qattahPay: QattahPaySDK
    @Published var qattahWebView: QattahWebView? = nil
    @Published var navigatToQattahWebView = false
    
    init(qattahPay: QattahPaySDK) {
        self.qattahPay = qattahPay
    }
    
    func payWithQattahPay(amount: Double, currency: Currency, orderId: String, description: String, userEmail: String, userPhoneNumber: String, language: Language, theme: Theme, isSandbox: Bool, onSuccess: @escaping (_ response: QattahResponse) -> Void, onFail: @escaping (_ errorMessage: String) -> Void) {
        
        let paymentRequest = PaymentRequestBuilder()
            .setAmount(amount)
            .setCurrency(currency)
            .setOrderId(orderId)
            .setDescription(description)
            .setCustomerEmail(userEmail)
            .setCustomerMobileNumber(userPhoneNumber)
            .setLanguage(language)
            .setTheme(theme)
            .isSandbox(isSandbox)
            .build()

        qattahPay.startPaymentSession(paymentRequest: paymentRequest, onSuccess: { qattahResponse in
            onSuccess(qattahResponse)
        }, onFail: { errorMessage in
            print("onFail: " + errorMessage)
        })
        
    }
}
