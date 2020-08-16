const express = require('express');
const userModel = require('../models/user.model');
const utilsModel = require('../models/utils.model');
const bcrypt = require('bcryptjs');
const categoryModel = require('../models/category.model');
const moment = require('moment');

const router = express.Router();

router.get('/', async function(req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const user = await userModel.all()
        for (var i = 0; i < user.length; i++) {
            if (user[i].Permission === 0) { user[i].ChucVu = 'Người dùng';
            } else if (user[i].Permission === 1) { user[i].ChucVu = 'Phóng viên';
            } else if (user[i].Permission === 2) { user[i].ChucVu = 'Biên tập viên';
            } else if (user[i].Permission === 3) { user[i].ChucVu = 'Quản trị viên'; }
            user[i].F_DOB = moment(user[i].DayOfBirth, 'YYYY-MM-DD').format('DD-MM-YYYY');
            if (user[i].Del === 1) { user[i].Delete = true; }
        }
        res.render('vwAccount/home', {
            user,
            empty: user.length === 0
        })
    } else {
        res.redirect('/')
    }
})

router.get('/edit/:id', async function(req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const id = +req.params.id || -1;
        const user = await userModel.singleByUserID(id);
            if (user.Permission === 0) {
                user.ChucVu = 'Người dùng';
            } else if (user.Permission === 1) {
                user.ChucVu = 'Phóng viên';
            } else if (user.Permission === 2) {
                user.ChucVu = 'Biên tập viên';
            } else if (user.Permission === 3) {
                user.ChucVu = 'Quản trị viên';
            }
        const category = await categoryModel.all2();
        const categoryManager = await utilsModel.showCategoryManagerByUID(id);
        for (var i = 0; i < categoryManager.length; i++) {
            const category = await categoryModel.singleByCID(categoryManager[i].CID);
            categoryManager[i].CName = category.CName;
        }
        user.F_DOB = moment(user.DayOfBirth, 'YYYY-MM-DD').format('YYYY-MM-DD');
        res.render('vwAccount/edit', {
            user,
            QAdmin: user.Permission === 3,
            QUser: user.Permission === 0,
            QWriter: user.Permission === 1,
            QEditor: user.Permission === 2,
            category,
            categoryManager
        })
    } else {
        res.redirect('/')
    }
})

router.post('/edit/:id', async function (req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const id = +req.params.id || -1;
        const user = await userModel.singleByUserID(id);
        req.body.DayOfBirth = moment(req.body.F_DOB, 'YYYY-MM-DD').format('YYYY-MM-DD');
        delete req.body.F_DOB;
        req.body.UserID = id
        if(req.body.Permission !== 3) {
            await utilsModel.delCategoryManagerByUserID(id);
        }
        await userModel.patch(req.body)
        
        res.redirect('/admin/users/edit/'+id)
    } else {
        res.redirect('/')
    }
})

router.post('/edit/setcate/:id', async function (req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const id = +req.params.id || -1;
        if (req.body.CID !== null) {
            for (var i = 0; i < req.body.CID.length; i++) {
                const entity = {
                    UserID: id,
                    CID: req.body.CID[i]
                }
                await utilsModel.setCategoryManager(entity)
            }
        }       
        res.redirect('/admin/users/edit/'+id)
    } else {
        res.redirect('/')
    }
})

router.post('/edit/unsetcate/:id', async function (req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const id = +req.params.id || -1;
        for (var i = 0; i < req.body.CID.length; i++) {
            await utilsModel.delCategoryManagerByCID(req.body.CID[i])
        }
        res.redirect('/admin/users/edit/'+id)
    } else {
        res.redirect('/')
    }
})
  
router.get('/del/:id', async function(req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const id = +req.params.id || -1;

        await userModel.del(id);
        res.redirect('/admin/users/');
    } else {
        res.redirect('/')
    }
})
  
router.get('/restore/:id', async function(req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const id = +req.params.id || -1;

        await userModel.restore(id);
        res.redirect('/admin/users/');
    } else {
        res.redirect('/')
    }
})

router.get('/delete/:id', async function (req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const id = +req.params.id || -1;
        await userModel.del2(id);
        res.redirect('/admin/users/');
    } else {
        res.redirect('/')
    }
})

module.exports = router;