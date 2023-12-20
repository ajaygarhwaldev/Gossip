const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
    name: String,
    username: String,
    email: String,
    password: String,
    bio: String,
    currentPartner: String,
    overallRating: Number,
    likes: Number,
    hates: Number,
    serverId: String,
    isAdmin: Boolean,
    listOfLikes: [{
        userID: String,
        username: String,
    },],
    listOfHates: [
        {
            userID: String,
            username: String,
        },
    ],
    crushes: [String]
});

const userModel = mongoose.model("user", userSchema, "users");

module.exports = { userModel };