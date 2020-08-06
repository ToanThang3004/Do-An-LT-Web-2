const express = require('express');
const categoryModel = require('../models/category.model');
const subcategoryModel = require('../models/subcategory.model');

const router = express.Router();

router.get('/:id', async function (req, res) {
    const id = +req.params.id || -1;

    const list = await subcategoryModel.single(id);
    for (var i = 0; i < list.length; i++) {
        if (list[i].Del == 1) {
            list[i].Xoa = true;
        } else {
            list[i].Xoa = false;
        }
    }
    const rows = await categoryModel.single(id);
    if (rows.length === 0)
        return res.send('Invalid parameter.');
    const category = rows[0];



    res.render('vwSubCate/list', {
        categories: list,
        category,
        xoa: list.Xoa === 1,
        empty: list.length === 0
    });
})

router.get('/:id/add', async function (req, res) {
    const id = +req.params.id || -1;
    const rows = await categoryModel.single(id);
    if (rows.length === 0)
      return res.send('Invalid parameter.');
  
    const category = rows[0];
    res.render('vwSubCate/add', { category });
})

router.post('/:id/add', async function (req, res) {
    const id = +req.params.id || -1;
    const entity = {
        SCName: req.body.SCName,
        CID: id
    };
    console.log(entity);
    await subcategoryModel.add(entity);
    
    res.redirect('/admin/subcategories/'+id);
})

router.get('/edit/:id', async function (req, res) {
    const id = +req.params.id || -1;
    const rows = await subcategoryModel.single2(id);
    if (rows.length === 0)
      return res.send('Invalid parameter.');
  
    const subcategory = rows[0];
    res.render('vwSubCate/edit', { subcategory });
})

router.post('/update', async function (req, res) {
    const id = req.body.SCID;
    await subcategoryModel.patch(req.body);
    res.redirect('/admin/subcategories/edit/'+id);
  })

router.post('/del/:id', async function(req, res) {
    const scid = req.body.SCID;
    const subcatory = await subcategoryModel.single2(scid);
    const cid = subcatory[0].CID;
    await subcategoryModel.del(req.body.SCID);

    res.redirect('/admin/subcategories/'+cid);
})
  
router.get('/del/:id', async function(req, res) {
    const id = +req.params.id || -1;
    const rows = await subcategoryModel.single2(id);
    if(rows.length === 0) 
        res.send('Invaild parameter.');
    const cid = rows[0].CID;

    await subcategoryModel.del(req.params.id);
    res.redirect('/admin/subcategories/'+cid);
})

router.post('/restore/:id', async function(req, res) {
    const scid = req.body.SCID;
    const subcatory = await subcategoryModel.single2(scid);
    const cid = subcatory[0].CID;
    await subcategoryModel.restore(req.body.SCID);

    res.redirect('/admin/subcategories/'+cid);
})
  
router.get('/restore/:id', async function(req, res) {
    const id = +req.params.id || -1;
    const rows = await subcategoryModel.single2(id);
    if(rows.length === 0) 
        res.send('Invaild parameter.');
    const cid = rows[0].CID;

    await subcategoryModel.restore(req.params.id);
    res.redirect('/admin/subcategories/'+cid);
})

module.exports = router;