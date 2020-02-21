const db = require("../data/seeds/DbConfig.js");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first()
    .then(scheme => {
      return scheme ? scheme : null;
    });
}

function findSteps(id) {
  db("schemes as sch")
    .join("steps as stp", "sch.id", "stp.scheme_id")
    .where({ scheme_id: id });
}

function add(body) {
  return db("schemes")
    .insert(body)
    .then(([id]) => {
      return findById(id);
    });
}

function update(body, id) {
  return db("schemes")
    .where({ id })
    .update(body)
    .then(() => {
      return findById(id);
    });
}

function remove(id) {
  findById(id);
  return db("schemes")
    .where({ id })
    .del();
}
