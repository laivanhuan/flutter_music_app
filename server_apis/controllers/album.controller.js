const { albums, Sequelize } = require("../models");
const { Response, Contants } = require("../utils");

const createAlbum = async (req, res) => {
  try {
    const { name } = req.body;

    const imgPath = req.file
      ? `/public/images/${req.file.filename}`
      : `/public/images/album_default.jpg`;

    const newAlbum = {
      name,
      cover: imgPath,
    };
    const resData = await albums.create(newAlbum);
    const response = new Response(200, "OK! Album created.", resData);
    res.status(200).send(response);
  } catch (error) {
    const response = new Response(500, "Error", error);
    res.status(500).send(response);
  }
};

module.exports = {
  createAlbum,
};
