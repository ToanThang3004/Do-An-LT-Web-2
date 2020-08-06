const express = require('express');
const categoryModel = require('../models/category.model');

const router = express.Router();

router.get('/', async function (req, res) {
    const list = await categoryModel.all();

    for (var i = 0; i < list.length; i++) {
        if (list[i].Xoa === 1) {
            list[i].del = true;
        } else {
            list[i].del = false;
        }
    }

    res.render('vwCategories/list', {
        categories: list,
        empty: list.length === 0
    });
})

router.get('/add', function (req, res) {
    res.render('vwCategories/add');
})
  
router.post('/add', async function (req, res) {
    await categoryModel.add(req.body);
    res.render('vwCategories/add');
})

router.post('/del/:id', async function(req, res) {
    await categoryModel.delL(req.body.ID);
    res.redirect('/admin/categories');
})
  
router.get('/del/:id', async function(req, res) {
    const id = +req.params.id || -1;
    const rows = await categoryModel.single(id);
    if(rows.length === 0) 
        res.send('Invaild parameter.');

    await categoryModel.delL(req.params.id);
    res.redirect('/admin/categories');
})

router.post('/restore/:id', async function(req, res) {
    await categoryModel.restoreL(req.body.ID);
    res.redirect('/admin/categories');
})
  
router.get('/restore/:id', async function(req, res) {
    const id = +req.params.id || -1;
    const rows = await categoryModel.single(id);
    if(rows.length === 0) 
        res.send('Invaild parameter.');

    await categoryModel.restoreL(req.params.id);
    res.redirect('/admin/categories');
})

router.get('/edit/:id', async function (req, res) {
    const id = +req.params.id || -1;
    const rows = await categoryModel.single(id);
    if (rows.length === 0)
      return res.send('Invalid parameter.');
  
    const category = rows[0];
    res.render('vwCategories/edit', { category });
})

router.post('/update', async function (req, res) {
    await categoryModel.patch(req.body);
    res.redirect('/admin/categories');
})

module.exports = router;