//
//  TaskOneRequest.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 22/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import Alamofire

struct TaskOneRequest: APIRequestBody, RestAPI {
    init(parameterOne: String, parameterTwo: String) {
        self.parameterOne = parameterOne
        self.parameterTwo = parameterTwo
    }
    
    var url: String {
        return GlobalDefinitions.domainUrl + "/api/taskonerequest"
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var parameters: Parameters? {
        return [
            "parameterOne": parameterOne,
            "parameterTwo": parameterTwo
        ]
    }
    
    private let parameterOne: String
    private let parameterTwo: String
}
