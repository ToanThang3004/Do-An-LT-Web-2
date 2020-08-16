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
    new: function () {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY TimePost DESC`);
    },
    new1: function (id) {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 and CID = ${id} ORDER BY TimePost DESC LIMIT 1`);
    },
    new10: function () {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY TimePost DESC LIMIT 10`);
    },
    hot10: function () {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY view DESC LIMIT 10`);
    },
    hot: function () {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY view DESC`);
    },
    best: function() {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY view DESC LIMIT 1`)
    },
    hot2: function () {
        return db.load(`select * from ${TBL_POSTS} where Duyet = 3 ORDER BY view DESC LIMIT 4`);
    },
    upview: function (id) {
        return db.load(`UPDATE ${TBL_POSTS} SET view = view + 1 where PostID = ${id}`)
    },
    search: function (value) {
        return db.load(`select DISTINCT * from ${TBL_POSTS} where PostTitle like N'%${value}%' OR SumContent like N'%${value}%' OR Content like N'%${value}%' ORDER BY Premium DESC`);
    },
}