const express = require('express');
const userModel = require('../models/user.model');
const bcrypt = require('bcryptjs');

const router = express.Router();

router.get('/dangky', async function (req, res) {
    const user = await userModel.all();
    res.render('_vwAccount/dangky', {
        list: user,
        count: user.length
    });
});


router.post('/dangky', async function (req, res) {
    const byUsername = await userModel.singleByUserName(req.body.username);
    const byEmail = await userModel.singleByEmail(req.body.email);
    const byPhone = await userModel.singleByPhone(req.body.phone);

    if (byUsername || byEmail || byPhone) {
        var invalid_username = false;
        var invalid_mail = false;
        var invalid_phone = false;
        if (byUsername) {
            invalid_username = true;        
        }
        if (byEmail) {
            invalid_mail = true;        
        }
        if (byPhone) {
            invalid_phone = true;        
        }
        res.render('_vwAccount/dangky', {
            invalid_username,
            invalid_mail,
            invalid_phone,
            info: req.body
        });
    } else {

    const password_hash = bcrypt.hashSync(req.body.password, 8);
    const entity = {
        username: req.body.username,
        password_hash,
        phone: req.body.phone,
        email: req.body.email,
        fullname: req.body.fullname,
        address: req.body.address,
        dayofbirth: req.body.dob
    }

    await userModel.add(entity);
    res.redirect('/dangnhap');
    }
});


module.exports = router;