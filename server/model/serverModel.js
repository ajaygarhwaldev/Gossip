const mongoose = require("mongoose");

const serverSchema = new mongoose.Schema({
    name: String,
    limit: String,
    logo: String,
    admin: String,
    password: String,
    adminPassword: String,
    membersList: [
        {
            "userId": String,
            "username": String,
        }
    ],
    blacklisted: [
        {
            "userId": String,
            "username": String,
        }
    ],
});

const serverModel = mongoose.model("server", serverSchema, "servers");
module.exports = { serverModel };