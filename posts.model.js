const db = require('../utils/db');

const TBL_POSTS = 'posts';

module.exports = {
    all: function() {
        return db.load(`select * from ${TBL_POSTS}`)
    },
    allPostSapPublic: function() {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 2`)
    },
    add: function(entity) {
        return db.add(TBL_POSTS, entity);
    },
    singleByCID: function (cid) {
        return db.load(`select * from ${TBL_POSTS} where CID = ${cid}`);
    },
    singleByPostID: function (id) {
        return db.load(`select * from ${TBL_POSTS} where PostID = ${id}`);
    },
    singleBySCID: function (id) {
        return db.load(`select * from ${TBL_POSTS} where SCID = ${id}`);
    },
    singleByUserID: function (id) {
      return db.load(`select * from ${TBL_POSTS} where UID = ${id}`);
    },
    patch: function (entity) {
        const condition = {
          PostID: entity.PostID
        }
        delete entity.PostID;
        return db.patch(TBL_POSTS, entity, condition);
    },
    move: function (id, cid, scid) {
        const condition = {
          PostID: id
        };
        const d = {
          CID: cid,
          SCID: scid
        };
        return db.patch(TBL_POSTS, d ,condition);
    }
}