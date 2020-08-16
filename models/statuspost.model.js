const db = require('../utils/db');

const TBL_PostStatus = 'poststatus';

module.exports = {
    add: function(entity) {
        return db.add(TBL_PostStatus, entity);
    }
}