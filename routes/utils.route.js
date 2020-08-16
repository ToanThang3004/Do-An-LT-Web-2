const express = require('express');
const userModel = require('../models/user.model');
const categoryModel = require('../models/category.model');
const subcategoryModel = require('../models/subcategory.model');
const postModel = require('../models/posts.model');
const moment = require('moment');
const commentModel = require('../models/comment.model');
const _postModel = require('../models/_post.model');
const router = express.Router();

router.get('/cat/:id', async function (req, res) {
    const id = +req.params.id || -1;
    const category = await categoryModel.singleByCID(id);
    const subcate = await subcategoryModel.singleforuser(id);
    const subcategory = subcate[0];
    const post = await postModel.singleByCIDXuatBan(id);

    for (var i = 0; i < post.length; i++) {
        post[i].Time = moment(post[i].TimePost, 'YYYY-MM-DD hh:mm:ss').fromNow();
        const cat_post = await categoryModel.singleByCID(post[i].CID);
        post[i].CName = cat_post.CName;
        const subcat_post = await subcategoryModel.single2(post[i].SCID);
        if (post[i].SCID !== null) {
            post[i].SCName = subcat_post[0].SCName;
        }
        if (post[i].Premium === 1) { post[i].Pre = true; }
    }

    res.render('_vwPosts/post_cat', {
        category,
        subcategory,
        post
    })
})

router.get('/subcat/:id', async function (req, res) {
    const id = +req.params.id || -1;
    const subcate = await subcategoryModel.single2(id);
    const subcategory = subcate[0];
    const post = await postModel.singleBySCIDXuatBan(id);

    for (var i = 0; i < post.length; i++) {
        post[i].Time = moment(post[i].TimePost, 'YYYY-MM-DD hh:mm:ss').fromNow();
        const cat_post = await categoryModel.singleByCID(post[i].CID);
        post[i].CName = cat_post.CName;
        const subcat_post = await subcategoryModel.single2(post[i].SCID);
        if (post[i].SCID !== null) {
            post[i].SCName = subcat_post[0].SCName;
        }
        if (post[i].Premium === 1) {
            post[i].Pre = true;
        }
    }
    res.render('_vwPosts/post_subcat', {
        subcategory,
        post
    })
})

router.post('/search', async function (req, res) {
    const result = await _postModel.search(req.body.search)
    for (var i = 0; i < result.length; i++) {
        result[i].Time = moment(result[i].TimePost, 'YYYY-MM-DD hh:mm:ss').fromNow();
        const cat_post = await categoryModel.singleByCID(result[i].CID);
        result[i].CName = cat_post.CName;
        const subcat_post = await subcategoryModel.single2(result[i].SCID);
        if (result[i].SCID !== null) {
            result[i].SCName = subcat_post[0].SCName;
        }
        if (result[i].Premium === 1) {
            result[i].Pre = true;
        }
    }
    res.render('search', { result, search: req.body.search, empty: result.length === 0 })
})

router.get('/comment/like/:id', async function (req, res) {
    if (req.isAuthenticated()) {
        const id = +req.params.id || -1;
        const comment = await commentModel.singleByComID(id);
        const commentlike = await commentModel.singleLikeByComID(id);
        const entity = {
            ComID: id,
            UID: req.user.UserID
        }
        console.log(commentlike);
        if (commentlike) {
            if (req.user.UserID === commentlike[0].UID) {
                res.redirect('/post/'+comment[0].PostID+'#comment');
            } else {         
                await commentModel.addLike(entity);
                res.redirect('/post/'+comment[0].PostID+'#comment');
            }
        } else {
            await commentModel.addLike(entity);
            res.redirect('/post/'+comment[0].PostID+'#comment');
        }
    } else {
        res.redirect('/dangnhap');
    }
})


module.exports = router;