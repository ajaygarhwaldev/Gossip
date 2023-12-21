const express = require("express");
const serverModelFile = require("../model/serverModel");
const { userModel } = require("../model/userModel");

const serverCreatingRoute = express.Router();

serverCreatingRoute.post("/server/create", async (req, res) => {
    try {
        var { serverImageCode, serverName, serverPassword, adminPassword, id } = req.body;
        if (serverImageCode == null) {
            res.status(400).json({
                msg: "Image is empty",
            });
            return;
        } else if (serverName == null || serverName.length < 6) {
            res.status(400).json({
                msg: "server name is empty",
            });
            return;
        } else if (serverPassword == null || serverPassword.length < 6) {
            res.status(400).json({
                msg: "Server password is too short",
            });
            return;
        } else if (adminPassword.length == null || adminPassword.length < 6) {
            res.status(400).json({
                msg: "Admin password is too short",
            });
            return;
        }

        // Checking whether server name is avilable or not
        var serverExist = await serverModelFile.serverModel.findOne({
            "name": serverName,
        });

        if (serverExist) {
            res.status(400).json({
                msg: "Server name not avilable",
            });
            return;
        }


        // Fetching the account of admin
        var adminAccount = await userModel.findById(id);

        // Creating the server here
        var newServer = new serverModelFile.serverModel({
            name: serverName,
            admin: adminAccount.id,
            blacklisted: [],
            limit: 20,
            password: serverPassword,
            adminPassword: adminPassword,
            logo: serverImageCode,
            membersList: [
                {
                    userId: adminAccount.id,
                    username: adminAccount.username,
                }
            ],
        });
        var serverResponse = await newServer.save();

        // Updating changes in users properties
        var userResponse = await userModel.findByIdAndUpdate(
            id,
            { $set: { isAdmin: true, serverId: serverResponse.id } }
        );

        if (serverResponse && userResponse) {
            res.status(200).json({
                msg: "Success",
                createdServer: true,
            });
        } else {
            res.status(400).json({
                msg: "Failue",
                createdServer: false,
            })
        }


    } catch (error) {
        res.status(400).json({
            msg: "Image is way too big",
            createdServer: false,
        })
    }
});

module.exports = { serverCreatingRoute };