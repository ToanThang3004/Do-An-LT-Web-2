const db = require('../utils/db');

const TBL_CategoryManager = 'categorymanager';


module.exports = {
    showCategoryManagerByUID: function (id) {
        return db.load(`select * from ${TBL_CategoryManager} where UserID = ${id}`);
    },
    showCIDCategoryManagerByUID: function (id) {
        return db.load(`select CID from ${TBL_CategoryManager} where UserID = ${id}`);
    },
    setCategoryManager: function (entity) {
        return db.add(TBL_CategoryManager, entity);
    },
    delCategoryManagerByUserID: function (id) {
        const condition = {
          UserID: id
        }
        return db.del(TBL_CategoryManager, condition);
    },
    delCategoryManagerByCID: function (id) {
        const condition = {
          CID: id
        }
        return db.del(TBL_CategoryManager, condition);
    }
};