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
    const cate = await categoryModel.allforuser();
    const post = await postModel.all();
    for (var i = 0; i < post.length; i++) {
        post[i].Time = moment(post[i].TimePost, 'YYYY-MM-DD hh:mm:ss').fromNow();
        const cat_post = await categoryModel.single(post[i].CID);
        post[i].CName = cat_post[0].CName;
        const subcat_post = await subcategoryModel.single2(post[i].SCID);
        if (post[i].SCID !== null) {
            post[i].SCName = ' / '+subcat_post[0].SCName;
        }
        const uid_post = await userModel.singleByUserID(post[i].UID);
        post[i].UserName = uid_post.UserName;
        if (post[i].Duyet === 0) {
            post[i].Duyetbai = 'Chưa duyệt';
            post[i].buttonduyet = true;
        } else if (post[i].Duyet === 1) {
            post[i].Duyetbai = 'Đã duyệt';
            post[i].buttonduyet = false;
        }
    }
    res.render('vwPosts/home', {
        post,
        list: cate,
        empty: cate.length === 0
    });
})

router.get('/status/:pid', async function(req, res) {
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
})

router.post('/status/:id', async function (req, res) {
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
})


router.get('/move/:pid', async function(req, res) {
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
})

router.get('/move/:pid/tocat/:cid', async function (req, res) {
    const pid = +req.params.pid || -1;
    const cid = +req.params.cid || -1;
    const scid = null;
   
    await postModel.move(pid, cid, scid);
    res.redirect('/admin/posts/cat/'+cid);
})
/*
router.get('/move/:pid/tosub/:scid', async function (req, res) {
    const pid = +req.params.pid || -1;
    const scid = +req.params.scid || -1;
    const subcategory = await subcategoryModel.single2(scid);
    const cid = await categoryModel.singleByCID(subcategory[0].CID);

    await postModel.move(pid, cid.CID, scid);
    res.redirect('/admin/posts/subcat/'+scid);
})
*/
router.get('/upload/:id', async function (req, res) {
    const id = +req.params.id || -1;
    const post = await postModel.singleByPostID(id);
    const rows = post[0];
    res.render('vwPosts/upload', {
        rows
    });
})

router.post('/upload/:id', function (req, res) {
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
})

router.get('/cat/:id', async function (req, res) {
    const id = +req.params.id || -1;
    const subcategory = await subcategoryModel.single(id);
    const category = await categoryModel.singleByCID(id);
    const post = await postModel.singleByCID(id);
    for (var i = 0; i < post.length; i++) {
        post[i].Time = moment(post[i].TimePost, 'YYYY-MM-DD hh:mm:ss').fromNow();
        if (post[i].SCID !== null) {
            const subcat_post = await subcategoryModel.single2(post[i].SCID);
            post[i].SCName = subcat_post[0].SCName;
        }
        const uid_post = await userModel.singleByUserID(post[i].UID);
        post[i].UserName = uid_post.UserName;
        if (post[i].Duyet === 0) {
            post[i].Duyetbai = 'Chưa duyệt';
        } else if (post[i] === 1) {
            post[i].Duyetbai = 'Đã duyệt';
        }
    }

    res.render('vwPosts/home', {
        category,
        list: subcategory,
        empty: subcategory.length === 0,
        post,
    })
})

router.get('/subcat/:id', async function (req, res) {
    const id = +req.params.id || -1;
    const sub = await subcategoryModel.single2(id);
    const subcategory = sub[0];
    const post = await postModel.singleBySCID(id);
    for (var i = 0; i < post.length; i++) {
        post[i].Time = moment(post[i].TimePost, 'YYYY-MM-DD hh:mm:ss').fromNow();
        const subcat_post = await subcategoryModel.single2(post[i].SCID);
        if (post[i].SCID !== null) {
            post[i].SCName = subcat_post[0].SCName;
        }
        const uid_post = await userModel.singleByUserID(post[i].UID);
        post[i].UserName = uid_post.UserName;
        if (post[i].Duyet === 0) {
            post[i].Duyetbai = 'Chưa duyệt';
        } else if (post[i] === 1) {
            post[i].Duyetbai = 'Đã duyệt';
        }
    }
    res.render('vwPosts/home', {
        subcategory,
        empty: subcategory.length === 0,
        post,
    })
})
 
router.get('/:id', async function (req, res) {
    const id = +req.params.id || -1;
    const post = await postModel.singleByPostID(id);
    const rows = post[0];
    if (rows.TimePost !== null) {
        rows.Time = moment(rows.TimePost, 'YYYY-MM-DD hh:mm:ss').format('hh:mmA DD/MM/YYYY');
    }
    const uid_post = await userModel.singleByUserID(rows.UID);
    rows.UserName = uid_post.UserName;
    rows.U_FullName = uid_post.Fullname;
    if (rows.Duyet === 0) {
        rows.Duyetbai = 'Chưa duyệt';
        rows.buttonduyet = true;
    } else if (rows.Duyet === 1) {
        rows.Duyetbai = 'Đã duyệt';
        rows.buttonduyet = false;
    }
    res.render('vwPosts/baiviet', {
        rows
    });
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
        res.redirect('/post/'+id)
    }
})

router.post('/update', async function (req, res) {
    const id = req.body.PostID;
    await postModel.patch(req.body);
    res.redirect('/admin/posts/edit/'+id);
})

router.get('/cat/:id/post', async function (req, res) {
    if (req.user.Permission === 1) {
        const id = +req.params.id || -1;
        const subcategory = await subcategoryModel.single(id);
        const category = await categoryModel.singleByCID(id);
        res.render('vwPosts/post', {
            category,
            subcategory
        })
    } else {
        res.redirect('/login');
    }
})

router.post('/cat/:id/post', async function (req, res) {
    const id = +req.params.id || -1;
    req.body.CID = id;
    var today = new Date();
    var time = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate()+' '+today.getHours()+':'+today.getMinutes()+':'+today.getSeconds();
    req.body.TimePost = time;
    req.body.UID = req.user.UserID;
    await postModel.add(req.body);
    res.redirect('/admin/posts/cat/'+id);
})



router.get('/duyet/:id', async function(req, res) {
    const id = +req.params.id || -1;
    const rows = await postModel.singleByPostID(id);
    if(rows.length === 0) 
        res.send('Invaild parameter.');

    await postModel.duyet(id);
    res.redirect('/admin/posts/'+id);
})

module.exports = router;