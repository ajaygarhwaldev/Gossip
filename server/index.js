const express = require("express");
const mongoose = require("mongoose");
// const bodyParser = require("body-parser");
const signUpRouteFile = require("./routes/signup");
const signInRouterFile = require("./routes/signin");
const verifyTokenRouterFile = require("./routes/verifyToken");
const fetchingServerRouterFile = require("./routes/fetchingServer");
const creatingServerRouterFile = require("./routes/creatingServer");
const serverJoinRouteFile = require("./routes/joiningServer");

const app = express();
app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ extended: true, limit: "50mb" }));
app.use(signUpRouteFile.signUpRouter);
app.use(signInRouterFile.signInRouter);
app.use(verifyTokenRouterFile.verifyTokenRouter);
app.use(fetchingServerRouterFile.fetchingServerRouter);
app.use(creatingServerRouterFile.serverCreatingRoute);
app.use(serverJoinRouteFile.serverJoinRoute);

const port = 3000;

// Connecting to server here
app.listen(port, "192.168.1.2", () => {
    console.log(`Server is running at port ${port}`);
});

// Connecting to the database here
async function main() {
    await mongoose.connect("mongodb+srv://ajaydisu0809:g39xbqDdQ89pVAx7@cluster0.j9jpu2c.mongodb.net/gossip?retryWrites=true&w=majority");
    console.log(`Connected to the database here`);
}
main().catch(e => console.log(e));