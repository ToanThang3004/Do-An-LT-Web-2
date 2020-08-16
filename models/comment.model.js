const db = require('../utils/db');

const TBL_COMMENT = 'comment';
const TBL_COMMENTLIKE = 'commentlike';

module.exports = {
    add: function(entity) {
        return db.add(TBL_COMMENT, entity);
    },
    addLike: function(entity) {
        return db.add(TBL_COMMENTLIKE, entity);
    },
    singleByPostID: function (id) {
        return db.load(`select * from ${TBL_COMMENT} where PostID = ${id}`);
    },
    countByPostID: function (id) {
        return db.load(`select count(*) as Count from ${TBL_COMMENT} where PostID = ${id}`);
    },
    singleByComID: function (id) {
        return db.load(`select * from ${TBL_COMMENT} where ComID = ${id}`);
    },
    singleLikeByComID: function(id) {
        return db.load(`select * from ${TBL_COMMENTLIKE} where ComID = ${id}`)
    }
}