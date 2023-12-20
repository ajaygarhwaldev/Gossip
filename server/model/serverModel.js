const mongoose = require("mongoose");

const serverSchema = new mongoose.Schema({
    name: String,
    limit: String,
    logo: String,
    participants: Number,
    membersList: [],
    blacklisted: [],
});

const serverModel = mongoose.model("server", serverSchema, "servers");
module.exports = { userModel: serverModel };