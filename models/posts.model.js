const db = require('../utils/db');

const TBL_POSTS = 'posts';

module.exports = {
    all: function() {
        return db.load(`select * from ${TBL_POSTS}`)
    },
    allByStatus: function(status) {
        return db.load(`select * from ${TBL_POSTS} where Duyet = ${status}`)
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
    singleByCIDStatus: function (cid, status) {
        return db.load(`select * from ${TBL_POSTS} where CID = ${cid} and Duyet = ${status}`);
    },
    singleByPostID: function (id) {
        return db.load(`select * from ${TBL_POSTS} where PostID = ${id}`);
    },
    singleByUserIDStatus: function (id, status) {
        return db.load(`select * from ${TBL_POSTS} where UID = ${id} and Duyet = ${status}`);
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
    },
    del: function (id) {
        const condition = {
          PostID: id
        };
        const d = {
          xoa: 1
        };
        return db.patch(TBL_POSTS, d ,condition);
    },
    restore: function (id) {
        const condition = {
          PostID: id
        };
        const d = {
          xoa: 0
        };
        return db.patch(TBL_POSTS, d ,condition);
    },
    del2: function (id) {
      const condition = {
        PostID: id
      }
      return db.del(TBL_POSTS, condition);
    }
}