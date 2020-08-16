const db = require('../utils/db');

const TBL_SUBCATEGORIES = 'subcategories';

module.exports = {
    all: function () {
        return db.load(`select * from ${TBL_SUBCATEGORIES}`);  
    },
    single: function (id) {
        return db.load(`select * from ${TBL_SUBCATEGORIES} where CID = ${id}`);
    },
    singleforuser: function (id) {
        return db.load(`select * from ${TBL_SUBCATEGORIES} where CID = ${id} and Del = 0`);
    },
    single2: function (id) {
        return db.load(`select * from ${TBL_SUBCATEGORIES} where SCID = ${id}`);
    },
    add: function (entity) {
        return db.add(TBL_SUBCATEGORIES, entity);
    },
    patch: function (entity) {
        const condition = {
          SCID: entity.SCID
        }
        delete entity.SCID;
        return db.patch(TBL_SUBCATEGORIES, entity, condition);
    },
    del: function (id) {
        const condition = {
          SCID: id
        };
        const d = {
          Del: 1
        };
        return db.patch(TBL_SUBCATEGORIES, d ,condition);
    },
    restore: function (id) {
        const condition = {
          SCID: id
        };
        const d = {
          Del: 0
        };
        return db.patch(TBL_SUBCATEGORIES, d ,condition);
    },
    del2: function (id) {
      const condition = {
        SCID: id
      }
      return db.del(TBL_SUBCATEGORIES, condition);
    }
}