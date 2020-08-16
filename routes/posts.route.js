const express = require('express');
const postModel = require('../models/posts.model');
const categoryModel = require('../models/category.model');
const subcategoryModel = require('../models/subcategory.model');
const router = express.Router();
const moment = require('moment');
const userModel = require('../models/user.model');
const multer = require('multer');
moment.locale('vi');

router.get('/', async function (req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const cate = await categoryModel.allforuser();
        const post = await postModel.all();
        for (var i = 0; i < post.length; i++) {
            post[i].Time = moment(post[i].TimePost, 'YYYY-MM-DD hh:mm:ss').format('hh:mmA DD/MM/YYYY');
            const cat_post = await categoryModel.single(post[i].CID);
            post[i].CName = cat_post[0].CName;
            const subcat_post = await subcategoryModel.single2(post[i].SCID);
            if (post[i].SCID !== null) { post[i].SCName = ' / '+subcat_post[0].SCName; }
            const uid_post = await userModel.singleByUserID(post[i].UID);
            post[i].UserName = uid_post.UserName;
            if (post[i].xoa === 1) { post[i].Delete = true; } 
        }
        const post_ChuaDuyet = await postModel.allByStatus(0);
        for (var i = 0; i < post_ChuaDuyet.length; i++) {
            post_ChuaDuyet[i].Time = moment(post_ChuaDuyet[i].TimePost, 'YYYY-MM-DD hh:mm:ss').format('hh:mmA DD/MM/YYYY');
            const cat_post = await categoryModel.single(post_ChuaDuyet[i].CID);
            post_ChuaDuyet[i].CName = cat_post[0].CName;
            const subcat_post = await subcategoryModel.single2(post_ChuaDuyet[i].SCID);
            if (post_ChuaDuyet[i].SCID !== null) { post_ChuaDuyet[i].SCName = ' / '+subcat_post[0].SCName; }
            const uid_post = await userModel.singleByUserID(post_ChuaDuyet[i].UID);
            post_ChuaDuyet[i].UserName = uid_post.UserName;
            if (post_ChuaDuyet[i].xoa === 1) { post_ChuaDuyet[i].Delete = true; } 
        }
        const post_TuChoi = await postModel.allByStatus(1);
        for (var i = 0; i < post_TuChoi.length; i++) {
            post_TuChoi[i].Time = moment(post_TuChoi[i].TimePost, 'YYYY-MM-DD hh:mm:ss').format('hh:mmA DD/MM/YYYY');
            const cat_post = await categoryModel.single(post_TuChoi[i].CID);
            post_TuChoi[i].CName = cat_post[0].CName;
            const subcat_post = await subcategoryModel.single2(post_TuChoi[i].SCID);
            if (post_TuChoi[i].SCID !== null) { post_TuChoi[i].SCName = ' / '+subcat_post[0].SCName; }
            const uid_post = await userModel.singleByUserID(post_TuChoi[i].UID);
            post_TuChoi[i].UserName = uid_post.UserName;
            if (post_TuChoi[i].xoa === 1) { post_TuChoi[i].Delete = true; } 
        }
        const post_ChoXuatBan = await postModel.allByStatus(2);
        for (var i = 0; i < post_ChoXuatBan.length; i++) {
            post_ChoXuatBan[i].Time = moment(post_ChoXuatBan[i].TimePost, 'YYYY-MM-DD hh:mm:ss').format('hh:mmA DD/MM/YYYY');
            const cat_post = await categoryModel.single(post_ChoXuatBan[i].CID);
            post_ChoXuatBan[i].CName = cat_post[0].CName;
            const subcat_post = await subcategoryModel.single2(post_ChoXuatBan[i].SCID);
            if (post_ChoXuatBan[i].SCID !== null) { post_ChoXuatBan[i].SCName = ' / '+subcat_post[0].SCName; }
            const uid_post = await userModel.singleByUserID(post_ChoXuatBan[i].UID);
            post_ChoXuatBan[i].UserName = uid_post.UserName;
            if (post_ChoXuatBan[i].xoa === 1) { post_ChoXuatBan[i].Delete = true; } 
        }
        const post_XuatBan = await postModel.allByStatus(3);
        for (var i = 0; i < post_XuatBan.length; i++) {
            post_XuatBan[i].Time = moment(post_XuatBan[i].TimePost, 'YYYY-MM-DD hh:mm:ss').format('hh:mmA DD/MM/YYYY');
            const cat_post = await categoryModel.single(post_XuatBan[i].CID);
            post_XuatBan[i].CName = cat_post[0].CName;
            const subcat_post = await subcategoryModel.single2(post_XuatBan[i].SCID);
            if (post_XuatBan[i].SCID !== null) { post_XuatBan[i].SCName = ' / '+subcat_post[0].SCName; }
            const uid_post = await userModel.singleByUserID(post_XuatBan[i].UID);
            post_XuatBan[i].UserName = uid_post.UserName;
            if (post_XuatBan[i].xoa === 1) { post_XuatBan[i].Delete = true; } 
        }

        res.render('vwPosts/home', {
            post,
            list: cate,
            empty: cate.length === 0,
            post_ChuaDuyet,
            post_TuChoi,
            post_ChoXuatBan,
            post_XuatBan
        });
    } else {
        res.redirect('/')
    }
})

router.get('/status/:pid', async function(req, res) {
    if (req.isAuthenticated() && req.user.Permission > 1) {
        const pid = +req.params.pid || -1;
        const pst = await postModel.singleByPostID(pid);
        const cate_post = await categoryModel.singleByCID(pst[0].CID);
        const subcate_post = await subcategoryModel.single2(pst[0].SCID);
        const sub_post = subcate_post[0];
        const category = await categoryModel.allforuser();
        for (var i = 0; i < category.length; i++) {
            const row = await subcategoryModel.singleforuser(category[i].CID);
            category[i].subcategories = row;
            category[i].PID = pid;
            for (var j = 0; j < category[i].subcategories.length; j++) {
                category[i].subcategories[j].PID = pid;
            }
        }

        const post = pst[0];
        res.render('vwPosts/status', {
            cate_post,
            sub_post,
            category,
            post
        })
    } else {
        res.redirect('/');
    }
})

router.post('/status/:id', async function (req, res) {
    if (req.isAuthenticated() && req.user.Permission > 1) {
        const id = +req.params.id || -1;
        req.body.PostID = id;
        if (req.body.Duyet === '1') {
            delete req.body.TimePublic;
            req.body.StatusPost = 'Bị từ chối';
        } else if (req.body.Duyet === '2') {
            req.body.StatusPost = 'Đã duyệt bài và chờ xuất bản';
        }
        await postModel.patch(req.body);
        res.redirect('/editorpanel');
    } else {
        res.redirect('/');
    }
})


router.get('/move/:pid', async function(req, res) {
    if (req.isAuthenticated() && req.user.Permission > 1) {
        const pid = +req.params.pid || -1;
        const pst = await postModel.singleByPostID(pid);
        const cate_post = await categoryModel.singleByCID(pst[0].CID);
        const subcate_post = await subcategoryModel.single2(pst[0].SCID);
        const sub_post = subcate_post[0];
        const category = await categoryModel.allforuser();
        for (var i = 0; i < category.length; i++) {
            const row = await subcategoryModel.singleforuser(category[i].CID);
            category[i].subcategories = row;
            category[i].PID = pid;
            for (var j = 0; j < category[i].subcategories.length; j++) {
                category[i].subcategories[j].PID = pid;
            }
        }

        const post = pst[0];
        res.render('vwPosts/move', {
            cate_post,
            sub_post,
            category,
            post
        })
    } else {
        res.redirect('/');
    }
})

router.get('/move/:pid/tocat/:cid', async function (req, res) {
    if (req.isAuthenticated() && req.user.Permission > 1) {
        const pid = +req.params.pid || -1;
        const cid = +req.params.cid || -1;
        const scid = null;
    
        await postModel.move(pid, cid, scid);
        res.redirect('/admin/posts/cat/'+cid);
    } else {
        res.redirect('/');
    }
})

router.get('/upload/:id', async function (req, res) {
    if (req.isAuthenticated() && (req.user.Permission === 1 || req.user.Permission === 3)) {
    const id = +req.params.id || -1;
    const post = await postModel.singleByPostID(id);
    const rows = post[0];
    res.render('vwPosts/upload', {
        rows
    });
    } else {
        res.redirect('/');
    }
})

router.post('/upload/:id', function (req, res) {
    if (req.isAuthenticated() && (req.user.Permission === 1 || req.user.Permission === 3)) {
        const id = +req.params.id || -1;
        const storage = multer.diskStorage({
            filename(req, file, cb) {
                const tenfile = id+'.png';
                cb(null, tenfile);
            },
            destination(req, file, cb) {
                cb(null, './public/images/avatarPost');
            }
        })

        const upload = multer({ storage });
        upload.array('fuMain', 3)(req, res, function (err) {
            if (!err) { 
                res.render('vwPosts/upload');
            } else {
                res.send('err');
            }
        });
    } else {
        res.redirect('/');
    }
})
 
router.get('/:id', async function (req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const id = +req.params.id || -1;
        const post = await postModel.singleByPostID(id);
        const rows = post[0];
        if (rows.TimePost !== null) {
            rows.Time = moment(rows.TimePost, 'YYYY-MM-DD hh:mm:ss').format('hh:mmA DD/MM/YYYY');
        }
        const uid_post = await userModel.singleByUserID(rows.UID);
        rows.UserName = uid_post.UserName;
        rows.U_FullName = uid_post.Fullname;
        
        res.render('vwPosts/baiviet', {
            rows
        });
    } else {
        res.redirect('/');
    }
})

router.get('/edit/:id', async function (req, res) {
    const id = +req.params.id || -1;
    const rows = await postModel.singleByPostID(id);
    const post = rows[0];
    if (req.isAuthenticated() && (req.user.Permission === 1 || req.user.Permission === 3) && (post.Duyet === 0 || post.Duyet === 1)) {
        const category = await categoryModel.singleByCID(post.CID);
        const sub = await subcategoryModel.single2(post.SCID);
        const subcategory = sub[0];
        post.CName = category.CName;
        post.SCName = subcategory.SCName;

        res.render('vwPosts/edit', {
            post
        });
    } else {
        res.redirect('/')
    }
})

router.post('/update', async function (req, res) {
    const id = req.body.PostID;
    await postModel.patch(req.body);
    res.redirect('/admin/posts/edit/'+id);
})

router.get('/del/:id', async function(req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const id = +req.params.id || -1;

        await postModel.del(id);
        res.redirect('/admin/posts/');
    } else {
        res.redirect('/')
    }
})

router.get('/restore/:id', async function(req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const id = +req.params.id || -1;

        await postModel.restore(id);
        res.redirect('/admin/posts/');
    } else {
        res.redirect('/')
    }
})

router.get('/delete/:id', async function (req, res) {
    if (req.isAuthenticated() && req.user.Permission === 3) {
        const id = +req.params.id || -1;
        await postModel.del2(id);
        res.redirect('/admin/posts/');
    } else {
        res.redirect('/')
    }
})

module.exports = router;