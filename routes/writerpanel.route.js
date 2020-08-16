const express = require('express');
const userModel = require('../models/user.model');
const categoryModel = require('../models/category.model');
const subcategoryModel = require('../models/subcategory.model');
const postModel = require('../models/posts.model');
const moment = require('moment');
const commentModel = require('../models/comment.model');
const { compareSync } = require('bcryptjs');
const { post } = require('./posts.route');
const router = express.Router();


router.get('/', async function (req, res) {
    if (req.isAuthenticated() && req.user.Permission === 1) {
        const category = await categoryModel.allforuser();
        const post_by_UID = await postModel.singleByUserID(req.user.UserID);
        const post_ChuaDuyet = await postModel.singleByUserIDStatus(req.user.UserID, 0);
        const post_TuChoi = await postModel.singleByUserIDStatus(req.user.UserID, 1);
        const post_ChoXuatBan = await postModel.singleByUserIDStatus(req.user.UserID, 2);
        const post_XuatBan = await postModel.singleByUserIDStatus(req.user.UserID, 3);
        for (var i = 0; i < post_by_UID.length; i++) {
            post_by_UID[i].Time = moment(post_by_UID[i].TimePost, 'YYYY-MM-DD hh:mm:ss').fromNow();
            const cat_post = await categoryModel.single(post_by_UID[i].CID);
            post_by_UID[i].CName = cat_post[0].CName;
            const subcat_post = await subcategoryModel.single2(post_by_UID[i].SCID);
            if (post_by_UID[i].SCID !== null) {
                post_by_UID[i].SCName = ' / '+subcat_post[0].SCName;
            }
            const uid_post = await userModel.singleByUserID(post_by_UID[i].UID);
        }
        res.render('writerpanel', {
            list: category,
            empty: category.length === 0,
            post: post_by_UID,
            post_ChuaDuyet,
            post_TuChoi,
            post_ChoXuatBan,
            post_XuatBan
        })
    } else {
        res.redirect('/');
    }
})

router.get('/post', async function (req, res) {
    if (req.isAuthenticated() && req.user.Permission === 1) {
        const category = await categoryModel.allforuser();
        for (var i = 0; i < category.length; i++) {
            const subcategory = await subcategoryModel.singleforuser(category[i].CID)
            category[i].Subcategory = subcategory;
        }
        res.render('vwPosts/post', {
            category        
        })
    } else {
        res.redirect('/');
    }
})

router.post('/post', async function (req, res) {
    const subcategory = await subcategoryModel.single2(req.body.SCID);
    req.body.CID = subcategory[0].CID;
    var today = new Date();
    var time = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate()+' '+today.getHours()+':'+today.getMinutes()+':'+today.getSeconds();
    req.body.TimePost = time;
    req.body.UID = req.user.UserID;
    await postModel.add(req.body);
    res.redirect('/writerpanel');
})




module.exports = router;