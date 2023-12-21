const express = require("express");
const serverModelFile = require("../model/serverModel");
const { userModel } = require("../model/userModel");

const serverJoinRoute = express.Router();

serverJoinRoute.post("/server/join", async (req, res) => {
    try {
        var { serverName, serverPassword, userId } = req.body;
        var serverExist = await serverModelFile.serverModel.findOne({
            name: serverName,
        });

        if (!serverExist) {
            res.status(400).json({
                msg: "Server doesn't exist",
            });
        };

        if (serverExist.password !== serverPassword) {
            res.json({
                msg: "Incorrect Password",
            });
            return;
        }

        var serverValues = await serverModelFile.serverModel.findOne({ name: serverName });
        var userValues = await userModel.findById(userId);

        // Adding the user to servers member list here
        var updateResponse = await serverModelFile.serverModel.updateOne(
            { name: serverName },
            { $push: { membersList: { userId: userValues._id, username: userValues.username } } }
        );

        // Updating the user's server id here
        var userUpdateResponse = await userModel.updateOne(
            { _id: userId },
            { $set: { serverId: serverValues._id } }
        );

        if (updateResponse.matchedCount && userUpdateResponse.modifiedCount) {
            res.status(200).json({
                msg: "Joined",
                joined: true,
            });
        } else {
            res.status(400).json({
                msg: "Failed to join",
                joined: false,
            });
        }

    } catch (error) {
        res.status(400).json({
            msg: "Server error",
            joined: false,
        });
    }
});

module.exports = { serverJoinRoute };