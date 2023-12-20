const express = require("express");
const userModelFile = require("../model/userModel");
const jwt = require("jsonwebtoken");

const verifyTokenRouter = express.Router();

verifyTokenRouter.post("/verify/token", async (req, res) => {
    try {
        var { token, id } = req.body;

        if (!token) {
            res.status(400).json({ msg: "No token avilable", validUser: false });
            return;
        };

        jwt.verify(token, "ajay0112", async (err, decoded) => {
            if (err) {
                res.status(400).json({ msg: "User not found", validUser: false });
                return;
            }

            var user = await userModelFile.userModel.findById(id);

            if (!user) {
                res.status(400).json({ msg: "User not Found", validUser: false });
                return;
            }

            res.status(200).json({
                msg: "Success",
                validUser: true,
            });
        });
    } catch (error) {
        res.status(500).json({
            msg: "Server error",
            validUser: false,
        });
    };

});

module.exports = { verifyTokenRouter };