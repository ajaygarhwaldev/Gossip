const chats = {
    chatid: "aslkjd0931284",
    participants: ["userID1", "userID2"],
    messages: [
        {
            id: "msgID1",
            sender: "userID1",
            msg: "Hii",
            timestamp: "1/1/1",
        },
        {
            id: "msgID2",
            sender: "userID2",
            msg: "Hey",
            timestamp: "1/1/1",
        },
        {
            id: "msgID3",
            sender: "userID2",
            msg: "How are you doing",
            timestamp: "1/1/1",
        },
    ]
}

const userInformation = {
    name: "String",
    username: "String",
    email: "String",
    password: "String",
    bio: "String",
    currentPartner: "String",
    overallRating: "Number",
    likes: "Number",
    hates: "Number",
    serverId: "String",
    isAdmin: "Bool",
    listOfLikes: [
        {
            userId: "String",
            username: "String",
        },
    ],
    listOfHates: [
        {
            userId: "String",
            username: "String",
        },
    ],
    crushes: []
}

const server = {
    name: "bruh",
    limit: 30,
    logo: "ashdkajshd",
    participants: 7,
    membersList: [
        {
            userId,
            username,
        }
    ],
    blacklisted: []
}

import 'package:flutter/material.dart';
