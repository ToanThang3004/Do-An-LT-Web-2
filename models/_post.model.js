const db = require('../utils/db');

const TBL_POSTS = 'posts';

module.exports = {
    singleByPostID: function (id) {
        return db.load(`select * from ${TBL_POSTS} where PostID = ${id} and Duyet = 3`);
    },
    tincungchuyenmuc: function (id) {
        return db.load(`select * from ${TBL_POSTS} where SCID = ${id} and Duyet = 3 ORDER BY RAND() LIMIT 5`);
    },
    singleByUserID: function (id) {
        return db.load(`select * from ${TBL_POSTS} where UID = ${id}`);
    },
    new: function (id) {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY TimePost DESC`);
    },
    new10: function (id) {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY TimePost DESC LIMIT 10`);
    },
    hot10: function (id) {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY view DESC LIMIT 10`);
    },
    hot: function (id) {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY view DESC`);
    },
    best: function() {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY view DESC LIMIT 1`)
    },
    hot2: function (id) {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY view DESC LIMIT 4`);
    },
    upview: function (id) {
        return db.load(`UPDATE ${TBL_POSTS} SET view = view + 1 where PostID = ${id}`)
    }
}