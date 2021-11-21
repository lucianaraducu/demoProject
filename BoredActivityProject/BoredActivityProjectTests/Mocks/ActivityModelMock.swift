//
//  ActivityModelMock.swift
//  BoredActivityProjectTests
//
//  Created by Luciana Raducu on 19.11.21.
//

@testable import BoredActivityProject

extension ActivityModel {
    static func create(
        activityName: String = "",
        accessibility: Double = 0,
        type: ActivityType = .busywork,
        participants: Int = 0,
        price: Double = 0,
        link: String = "",
        key: String = ""
    ) -> ActivityModel {
        ActivityModel(
            activity: activityName,
            accessibility: accessibility,
            type: type,
            participants: participants,
            price: price,
            link: link,
            key: key
        )
    }
}
