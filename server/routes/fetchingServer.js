const mongoose = require("mongoose");
const express = require("express");
const serverModelFile = require("../model/serverModel");

const fetchingServerRouter = express.Router();

fetchingServerRouter.post("/server", async (req, res) => {
    try {
        var { text } = req.body;
        var response = await serverModelFile.serverModel.find({
            "name": { "$regex": text }
        }).sort({ participants: -1 }).limit(5);
        res.status(200).json(response);
    } catch (e) {
        console.log(e);
    }
});

module.exports = { fetchingServerRouter };