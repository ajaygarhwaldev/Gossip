const express = require("express");
const userModelFile = require("../model/userModel");
const bcrypt = require("bcryptjs");

const signUpRouter = express.Router();

signUpRouter.post("/user/signup", async (req, res) => {
    try {
        var { username, email, password } = req.body;

        // Checking valid email
        if (!checkValidEmail(email)) {
            res.status(400).json({
                msg: "Invalid Email format",
            });
            return;
        };

        // Checking if email is already not registered
        var emailExist = await userModelFile.userModel.findOne({
            email: email,
        });

        if (emailExist) {
            res.status(400).json({
                msg: "Email Already Exist",
            });
            return;
        }

        // Checking password length
        if (passwordTooShort(password)) {
            res.status(400).json({
                msg: "Password length is too small",
            });
            return;
        }

        // Checking if username is not null
        if (isUsernameEmpty(username)) {
            res.status(400).json({
                msg: "Username can't be null",
            });
        };

        // Checking if username does exist
        var usernameExist = await userModelFile.userModel.findOne({
            username: username,
        });

        if (usernameExist) {
            res.status(400).json({
                msg: "Username not avilable",
            });
            return;
        };

        // Hashing the password here
        var hashesdPassword = await bcrypt.hash(password, 10);

        var newUser = new userModelFile.userModel({
            username: username,
            email: email,
            password: hashesdPassword,
            bio: "",
            crushes: [],
            currentPartner: "",
            hates: 0,
            likes: 0,
            isAdmin: false,
            listOfHates: [],
            listOfLikes: [],
            name: "",
            overallRating: 0,
            serverId: "",
        });
        var response = await newUser.save();
        res.status(200).json({
            msg: "Success",
        });
    } catch (error) {
        res.status(500).json({
            msg: "Internal Server error",
        });
        console.log(error);
    }
});

function checkValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

function passwordTooShort(password) {
    return password.length < 6;
}

function isUsernameEmpty(username) {
    return username.length == 0;
}

module.exports = { signUpRouter };