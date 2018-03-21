//
//  Typealias.swift
//  Turncast
//
//  Created by Manu S. Stier on 21/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation

import FirebaseAuth


typealias Profile = Dictionary<String, Any>
typealias ProfileAnyHashable = Dictionary<String, AnyHashable>

typealias CompletionAnyObject = (_ error: String?, _ data: AnyObject?) -> Void
typealias CompletionUserFirebase = (_ error: String?, _ data: User?) -> Void


typealias CompletionAlgoliaItem = (_ error: String?, _ content: [String: Any]?) -> Void


//typealias CompletionItem = (_ error: String?, _ data: Item?) -> Void
//typealias CompletionLoan = (_ error: String?, _ data: Loan?) -> Void
//typealias CompletionArrayItems = (_ error: String?, _ data: [Item]?) -> Void
//typealias CompletionArrayLoans = (_ error: String?, _ data: [Loan]?) -> Void
//typealias CompletionBool = (_ error: String?, _ data: Bool) -> Void
//typealias CompletionUser = (_ error: String?, _ data: UserUlend?) -> Void


