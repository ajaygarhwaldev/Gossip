const express = require("express");
const userModelFile = require("../model/userModel");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const signInRouter = express.Router();

signInRouter.post("/user/signin", async (req, res) => {
    try {
        var { username, password } = req.body;
        var userExist = await userModelFile.userModel.findOne({
            username: username,
        });

        if (!userExist) {
            res.status(400).json({
                msg: "user not found",
            });
            return;
        }

        var passwordCorrect = await bcrypt.compare(password, userExist.password);
        if (!passwordCorrect) {
            res.status(400).json({
                msg: "Incorrect Password",
            });
            return;
        }

        var token = jwt.sign({ userID: userExist._id }, "ajay0112");
        res.status(200).json({
            userExist,
            msg: "Logged In",
            token: token,
            serverId: userExist.serverId,
        });

    } catch (error) {
        res.status(500).json({
            msg: "Internal Server error",
        });
        console.log(error);

    };
});

module.exports = { signInRouter };