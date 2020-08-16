const express = require('express');
const userModel = require('../models/user.model');
const bcrypt = require('bcryptjs');
const moment = require('moment');
const router = express.Router();

router.get('/profile', function (req, res) {
    if (req.isAuthenticated()) {
        req.user.F_DOB = moment(req.user.DayOfBirth, 'YYYY-MM-DD').format('DD-MM-YYYY');

        res.render('_vwAccount/profile', {
            user: req.user,
            qUser: req.user.Permission === 0,
            qWriter: req.user.Permission === 1,
            qEditor: req.user.Permission === 2,
            qAdmin: req.user.Permission === 3
        })
    } else {
        res.redirect('/dangnhap')
    }
})

router.get('/profile/edit', function (req, res) {
    if (req.isAuthenticated()) {
        req.user.F_DOB = moment(req.user.DayOfBirth, 'YYYY-MM-DD').format('YYYY-MM-DD');

        res.render('_vwAccount/edit', {
            user: req.user
        });
    } else {
        res.redirect('/dangnhap');
    }
})

router.post('/profile/edit', async function (req, res) {
    if (req.isAuthenticated()) {
        req.body.UserID = req.user.UserID;
        req.body.DayOfBirth = req.body.F_DOB;
        delete req.body.F_DOB;

        await userModel.patch(req.body);
        req.user.F_DOB = moment(req.user.DayOfBirth, 'YYYY-MM-DD').format('DD-MM-YYYY');

        res.redirect('/profile');

    } else {
        res.redirect('/dangnhap');
    }
})

router.post('/naptien', async function (req, res) {
    if (req.isAuthenticated()) {
        console.log(req.user)
        req.user.F_DOB = moment(req.user.DayOfBirth, 'YYYY-MM-DD').format('DD-MM-YYYY');
        req.body.tien = Number(req.body.tien)
        const entity = {
            UserID: req.user.UserID,
            tien: req.user.tien + req.body.tien 
        }
        await userModel.patch(entity);
        const naptien_success = true;

        res.render('_vwAccount/profile', {
            naptien_success,
            tienvuanap: req.body.tien,
            user: req.user,
            qUser: req.user.Permission === 0,
            qWriter: req.user.Permission === 1,
            qEditor: req.user.Permission === 2,
            qAdmin: req.user.Permission === 3
        });
    } else {
        res.redirect('/dangnhap')
    }
})


module.exports = router;