const db = require('../utils/db');

const TBL_USERS = 'users';


module.exports = {
    all: function () {
        return db.load(`select * from ${TBL_USERS}`);
    },
    add: function(entity) {
        return db.add(TBL_USERS, entity);
    },
    singleByUserName: async function (username) {
        const rows = await db.load(`select * from ${TBL_USERS} where username = '${username}'`);
        if (rows.length === 0)
          return null;
    
        return rows[0];
    },
    singleByEmail: async function (email) {
        const rows = await db.load(`select * from ${TBL_USERS} where Email = '${email}'`);
        if (rows.length === 0)
          return null;
    
        return rows[0];
    },
    singleByPhone: async function (phone) {
        const rows = await db.load(`select * from ${TBL_USERS} where Phone = '${phone}'`);
        if (rows.length === 0)
          return null;
    
        return rows[0];
    },
    singleByUserID: async function (id) {
      const rows = await db.load(`select * from ${TBL_USERS} where UserID = '${id}'`);
      if (rows.length === 0)
        return null;
  
      return rows[0];
    },
    single: async function (username) {
      return db.load(`select * from ${TBL_USERS} where username = ${username}`);
    },
    patch: function (entity) {
      const condition = {
        UserID: entity.UserID
      }
      delete entity.UserID;
      return db.patch(TBL_USERS, entity, condition);
    },
    del: function (id) {
      const condition = {
        UserID: id
      };
      const d = {
        Del: 1
      };
      return db.patch(TBL_USERS, d ,condition);
    },
    restore: function (id) {
      const condition = {
        UserID: id
      };
      const d = {
        Del: 0
      };
      return db.patch(TBL_USERS, d ,condition);
    },
    del2: function (id) {
    const condition = {
      UserID: id
    }
    return db.del(TBL_USERS, condition);
    }
};