//
//  QattahPaymentCallback.swift
//  QattahPaySampleWithSDK
//
//  Created by khlafawi on 12/05/2023.
//

import Foundation
import qattahpay_ios_sdk

class QattahPaymentCallback: PaymentCallback, ObservableObject {
    
    func onStarted(paymentId: String) {
        print("onStarted: " + paymentId)
    }
    
    func onSuccess(paymentId: String) {
        print("onSuccess: " + paymentId)
    }
    
    func onError(errorMessage: String) {
        print("onError: " + errorMessage)
    }
    
    func onCancel() {
        print("onCancel")
    }
}
