const express = require("express");
const { exec } = require("child_process");
const path = require("path");
const { stderr } = require("process");
const app = express();

app.use(express.static(path.join(__dirname, "./public")));

const IP = "192.168.163.76";
const PORT = 3000;
const interface = "wlp2s0";

exec("sh script.sh", (error, stdout, stderr) => {
  if (error) {
    console.log("Error  : " + error);
  }
  if (stderr) {
    console.log("Script stderror : " + stderr);
  }
  console.log("Script output : " + stdout);
});

app.listen(PORT, IP, () => {
  console.log(`The server is running on http://${IP}:${PORT}`);
});
