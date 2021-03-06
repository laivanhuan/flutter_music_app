const { playlists, songs, playlist_song, Sequelize } = require("../models");
const { Response, Contants } = require("../utils");

const createPlaylist = async (req, res) => {
  try {
    const { name } = req.body;

    const user_id = req.user_data?.id;

    const newplaylist = {
      name,
      user_id,
    };
    const resData = await playlists.create(newplaylist);
    const response = new Response(200, "OK! Playlist created.", resData);
    res.status(200).send(response);
  } catch (error) {
    const response = new Response(500, "Error", error);
    res.status(500).send(response);
  }
};

const addSongsToPlaylist = async (req, res) => {
  try {
    const { songIds } = req.body;
    const { playlistId } = req.params;

    if (!playlistId || !songIds) {
      const response = new Response(500, "Missing require value");
      return res.status(500).send(response);
    }

    const data = songIds.map((id) => {
      return {
        song_id: id,
        playlist_id: playlistId,
      };
    });
    const resData = await playlist_song.bulkCreate(data);
    const response = new Response(200, "OK! Songs added.", resData);
    res.status(200).send(response);
  } catch (error) {
    const response = new Response(500, "Error", error);
    res.status(500).send(response);
  }
};

const getPlaylists = async (req, res) => {
  try {
    const { page = 1, size = 20 } = req.query;
    const user_id = req.user_data?.id;

    const resData = await playlists.findAndCountAll({
      limit: size - 0,
      offset: (page - 1) * (size - 0),
      where: {
        user_id,
      },
    });

    const response = new Response(200, "OK", resData);
    res.status(200).send(response);
  } catch (error) {
    const response = new Response(500, "Error", error);
    res.status(500).send(response);
  }
};

const deletePlaylist = async (req, res) => {
  try {
    const { id } = req.params;
    const user_id = req.user_data?.id;

    const playlistRes = await playlists.findOne({
      where: {
        user_id,
        id,
      },
    });

    if (!playlistRes) {
      const response = new Response(404, "Playlist does not exist");
      return res.status(404).send(response);
    }

    await playlist_song.destroy({
      where: {
        playlist_id: id,
      },
    });

    await playlists.destroy({
      where: {
        user_id,
        id,
      },
    });

    const response = new Response(200, "OK");
    res.status(200).send(response);
  } catch (error) {
    const response = new Response(500, "Error", error);
    res.status(500).send(response);
  }
};

const getPlaylistDetails = async (req, res) => {
  try {
    const { id } = req.params;

    const data = await playlist_song.findAll({
      include: [
        {
          model: songs,
          attributes: ["id", "name", "play_count"],
        },
        {
          model: playlists,
        },
      ],
      where: {
        playlist_id: id,
      },
    });

    const resData = data.reduce((arr, item) => {
      return [...arr, ...item.songs];
    }, []);

    const response = new Response(200, "OK", resData);
    res.status(200).send(response);
  } catch (error) {
    const response = new Response(500, "Error", error);
    res.status(500).send(response);
  }
};

module.exports = {
  addSongsToPlaylist,
  createPlaylist,
  getPlaylists,
  deletePlaylist,
  getPlaylistDetails,
};
