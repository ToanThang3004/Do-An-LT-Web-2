const express = require('express');
const postModel = require('../models/posts.model');
const categoryModel = require('../models/category.model');
const subcategoryModel = require('../models/subcategory.model');
const _postModel = require('../models/_post.model');
const router = express.Router();
const moment = require('moment');
const userModel = require('../models/user.model');
const multer = require('multer');
const commentModel = require('../models/comment.model');

moment.locale('vi');

router.get('/new', async function (req, res) {
    const post = await _postModel.new();
    for (var i = 0; i < post.length; i++) {
        post[i].Time = moment(post[i].TimePost, 'YYYY-MM-DD hh:mm:ss').fromNow();
        const cat_post = await categoryModel.singleByCID(post[i].CID);
        post[i].CName = cat_post.CName;
        const subcat_post = await subcategoryModel.single2(post[i].SCID);
        if (post[i].SCID !== null) {
            post[i].SCName = subcat_post[0].SCName;
        }
    }
    
    res.render('_vwPosts/new', {
        post
    });
})

router.get('/hot', async function (req, res) {
    const post = await _postModel.hot();
    for (var i = 0; i < post.length; i++) {
        post[i].Time = moment(post[i].TimePost, 'YYYY-MM-DD hh:mm:ss').fromNow();
        const cat_post = await categoryModel.singleByCID(post[i].CID);
        post[i].CName = cat_post.CName;
        const subcat_post = await subcategoryModel.single2(post[i].SCID);
        if (post[i].SCID !== null) { 
            post[i].SCName = subcat_post[0].SCName;
        }
    }
    
    res.render('_vwPosts/hot', {
        post
    });
})

router.get('/:id', async function (req, res) {
    const id = +req.params.id || -1;
    const pst = await postModel.singleByPostID(id);
    const post = pst[0];
    const ufullname = await userModel.singleByUserID(post.UID);
    post.U_FullName = ufullname.Fullname;
    post.Time = moment(post.TimePost, 'YYYY-MM-DD hh:mm:ss').format('hh:mmA DD/MM/YYYY');
    const comment = await commentModel.singleByPostID(id);
    for (var i = 0; i < comment.length; i++) {
        const u = await userModel.singleByUserID(comment[i].UID);
        comment[i].username = u.UserName;
        comment[i].Time = moment(comment[i].Date, 'YYYY-MM-DD hh:mm:ss').fromNow();
    }
    const tincungchuyenmuc = await _postModel.tincungchuyenmuc(post.SCID);
    await _postModel.upview(id);
    res.render('_vwPosts/baiviet', {
        post, 
        comment,
        tincungchuyenmuc,
        empty: tincungchuyenmuc.length === 0
    });
}) 

router.post('/:id', async function (req, res) {
    const id = +req.params.id || -1;
    req.body.UID = req.user.UserID;
    req.body.PostID = id;
    var today = new Date();
    var time = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate()+' '+today.getHours()+':'+today.getMinutes()+':'+today.getSeconds();
    req.body.Date = time;
    await commentModel.add(req.body);
    res.redirect('/post/'+id);
})


module.exports = router;