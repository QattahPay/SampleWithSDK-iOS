//
//  QattahPaymentCallback.swift
//  QattahPaySampleWithSDK
//
//  Created by khlafawi on 12/05/2023.
//

import Foundation
import qattahpay_ios_sdk

class QattahPaymentCallback: PaymentCallback {
    
    func onStarted(paymentId: String) {
        print(paymentId)
    }
    
    func onSuccess(paymentId: String) {
        print(paymentId)
    }
    
    func onError(errorMessage: String) {
        print(errorMessage)
    }
    
    func onCancel() {
        print("onCancel")
    }
}
